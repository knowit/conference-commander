$(document).on 'turbolinks:load', ->
  $('#show-conferences').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#frontpage-events").offset().top
    }, 1000)
