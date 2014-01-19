$(function(){
  var attachEvents = function(event){
    //clear resizable divs from original div
    //event.find('.ui-resizable-handle').remove();
    //
    event.resizable(schedule.resizeSettings);
    event.draggable(schedule.dragSettings);
  };
  var activateControls = function(what){
    //clear controls and reassign
    $(what).find('a').remove();
    $(what).append('<a class="remove-button">У</a>');
    $(what).append('<a class="submit-button">С</a>');
    //assign functions to controls
    $('.remove-button').click(function(event){
      $(this).parent().remove();
      //when removing block with event_id we should send an ajax request
      //to delete the event from DB
      eventId = $(this).parent().attr('id').split('-')[1];
      if(eventId){
        $.ajax('/admin/events/'+eventId,{
          type: 'DELETE',
          data: { id: eventId },
          success: deleteSuccess,
          error: deleteError
        });
      }
    });
    $('.submit-button').click(function(event){
      //ajax query to save event
      //for existing events we send event_ids
      //for all we send group_id, start_time and duration
      var params = $(this).parent().attr('id').split('-');
      var eventId = params[1];
      var urlVar = '/admin/events';
      var typeVar = 'POST';
      if(eventId!='false'){
        urlVar = '/admin/events/'+eventId;
        typeVar = 'PUT';
      };
      $.ajax(urlVar,{
        type: typeVar,
        data: { event: {
          group_id: params[5],
          day: params[2],
          start: params[3],
          duration: params[4],
          event_id: eventId
        }},
        dataType: 'json',
        success: saveSuccess,
        error: saveError,
      });
      //after success we assign event_id to this block
      //and remove submit-button
    });
  };
  var attachElement = function(what,to){
    //clone only if starting from outside schedule
    if (what.parents('.groups').length>0){
      what = $(what.clone());
    }
    what.appendTo(to);
    what.addClass('event');
    return what;
  }
  var updateId = function(div,period){
    periodAttrs = period.attr('id').split('-');
    eventAttrs = div.attr('id').split('-');
    div.attr('id',
      'event-'+
      eventAttrs[1]+'-'+
      periodAttrs[1]+'-'+
      periodAttrs[2]+'-'+
      parseInt(div.css('height'))+'-'+
      eventAttrs[5]
    );
  }
  var schedule = {
    settings: {
    },
    dragSettings: {
      helper: "clone"
    },
    resizeSettings: {
      //resize height proportional to period block's height
      grid: [0,30],
      //resize only height
      handles: 'n,s',
      //to do: activate save on element
      stop: function(event,ui){  
        activateControls($(this));
        updateId($(this),$(this).parent());    
      }
      //to do: restrict expanding block out of schedule
    },
    setup: function(){
      $('.draggable').draggable(this.dragSettings);
      $('.resizable').resizable(this.resizeSettings);
      $('.period').droppable({
        tolerance: "pointer",
        drop: function(event,ui){
          //attach to schedule div
          clone = attachElement(ui.draggable,this);
          //activate controls of event
          activateControls(clone);
          //attach events to event
          attachEvents(clone);
          //update id to format event-id(false)-day-start-duration-group_id
          updateId(clone,$(this));
        }
      });
      //set events on schedule plain
      $('.event').each(function(i){
        //id: event-id-day-start-duration-group_id
        var data = $(this).attr('id').split('-');
        attachElement($(this), $('#period-'+data[2]+'-'+data[3]));
        //set size by duration
        $(this).css('height',data[4]);
        attachEvents($(this));
        activateControls($(this));
      });
    }
  };
  var saveSuccess = function(data,status){
    //data have selector to identify processed block
    notify('Событие сохранено');
    block = $(data.selector);
    //remove button till next change
    block.find('.submit-button').remove();
    //assign new id
    block.attr('id',data.id);
  };
  var saveError = function(){
    notify('Ошибка при сохранении');
  };
  var deleteSuccess = function(data,status){
    notify('Событие удалено');
  };
  var deleteError = function(){
    notify('Ошибка при удалении');
  };
  var notify = function(message){
    var div = $('.message').text(message);
    div.animate({
      opacity: 'show'
    },'fast','swing').delay(3000).animate({
      opacity: 'hide'
    },'fast','swing');
  };
  schedule.setup();
});
