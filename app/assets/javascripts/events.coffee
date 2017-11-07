# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# $(document).on 'turbolinks:load', ->
#   $('.calendar').calendar(type: 'datetime')

$(document).on 'turbolinks:load', ->
  $('.simple_form').on 'keydown', (e) ->
    if e.keyCode == 13
      e.preventDefault()
