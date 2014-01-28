$(function(){
  var attachElement = function(what,to){
    what.appendTo(to);
    return what;
  };
  $('.event').each(function(i){
    //id: event-id-day-start-duration-group_id
    var data = $(this).data('event');
    attachElement($(this), $('#period-'+data.day+'-'+data.start));
    //set size by duration
    $(this).css('height',data.duration);
  });
  $('.event').hover(function(){
    $(this).children('.event-helper').toggle();
  });
  $('.lightbox').click(function(){
    $('body').css('overflow-y', 'hidden');
    $('<div id="overlay"></div>')
      .css('top', '0')
      .css('opacity', '0')
      .animate({opacity:'.5'},'slow')
      .appendTo('body');
    $('<div id="lightbox"></div>')
      .hide()
      .appendTo('body');
    $('<img>')
      .attr('src',$(this).attr('full'))
      .load(function(){
        positionLightboxImage();
      })
      .click(function(){
        removeLightbox();
      })
      .appendTo('#lightbox');
      
      return false;
  });
  function positionLightboxImage(){
    var top = ($(window).height() - $('#lightbox').height()) / 2;
    var left = ($(window).width() - $('#lightbox').width()) / 2;
    $('#lightbox')
      .css({
        'top': top,
        'left': left
      }).fadeIn();
  };
});
