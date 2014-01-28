# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.coach').hover ->
    $(this).children('.overlay').hide()
    $(this).find('.name-block p').addClass('active')
    $(this).stop(true,true).animate
      width: '+=30px',
      duration: 'slow'
    $(this).siblings('.coach').stop(true,true).animate
      width: '-=10px',
      duration: 'slow'
  , ->
    $(this).children('.overlay').show()
    $(this).find('.name-block p').removeClass('active')
    $(this).stop(true,true).animate
      width: '-=30px',
      dureation: 'slow'
    $(this).siblings('.coach').stop(true,true).animate
      width: '+=10px',
      duration: 'slow'
