# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  coachMouseenter = ()->
    $(this).children('.overlay').hide()
    $(this).find('.name-block p').addClass('active')
    $(this).parent('.coach').siblings('.coach').stop(true,true).animate
      width: '-=10px',
      duration: 'slow'
    $(this).parent('.coach').stop(true,true).animate
      width: '+=30px',
      duration: 'slow'
  coachMouseleave = ()->
    $(this).children('.overlay').show()
    $(this).find('.name-block p').removeClass('active')
    $(this).parent('.coach').stop(true,true).animate
      width: '-=30px',
      duration: 'slow'
    $(this).parent('.coach').siblings('.coach').stop(true,true).animate
      width: '+=10px',
      duration: 'slow'
  coachClick = ()->
    $(this).unbind('mouseenter mouseleave click');
    $(this).children('.name-block').fadeOut()
    $(this).parent('.coach').siblings('.coach').stop(true,true).animate
      width: '0',
      duration: 'slow'
    .fadeOut()
    $(this).parent('.coach').stop(true, true).animate
      width: '100%',
      duration: 'slow'
    .find('.description').fadeIn()
  $('.coach-main').hover(coachMouseenter, coachMouseleave)
  $('.coach-main').click(coachClick)  
  $('.coach .description .close').click ->
    coachMain = $(this).parents('.coach').find('.coach-main')
    coach = $(this).parents('.coach')
    $(coach).stop(true,true).animate
      width: '25%',
      duration: 'slow'
    .find('.description').fadeOut()
    $(coachMain).children('.name-block').fadeIn()
    $(coach).siblings('.coach').fadeIn().stop(true,true).animate
      width: '25%',
      duration: 'slow'
    $(coachMain).children('.overlay').show()
    $(coachMain).find('.name-block p').removeClass('active')
    $(coachMain).hover(coachMouseenter, coachMouseleave)
    $(coachMain).click(coachClick)
