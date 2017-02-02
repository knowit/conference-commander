$(document).on 'turbolinks:load', ->
  menu = $('#top-menu')
  top_photo = $('#lofoten')
  $('#show-conferences').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#frontpage-events").offset().top
    }, 1000)
  $(window).on 'scroll', ->
    scroll = $(window).scrollTop();
    positionNav = scroll-(top_photo.height() + 56)
    console.log(positionNav)
    if positionNav >= 0
      menu.addClass('fixed')
    else
      menu.removeClass('fixed')
