$(document).on 'turbolinks:load', ->

  $('#show-conferences').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#frontpage-events").offset().top
    }, 1000)
  $(window).on 'scroll', ->
    menu = $('#top-menu')
    top_photo = $('#lofoten')
    scroll = $(window).scrollTop();
    if scroll > top_photo.height() + 200
      menu.addClass('fixed')
    else
      menu.removeClass('fixed')
