$(function(){
  var attachElement = function(what,to){
    what.appendTo(to);
    return what;
  };
  $('.event').each(function(i){
    //id: event-id-day-start-duration-group_id
    var data = $(this).attr('id').split('-');
    attachElement($(this), $('#period-'+data[2]+'-'+data[3]));
    //set size by duration
    $(this).css('height',data[4]);
  });
});
