# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$(document).on 'turbolinks:load', ->
  $('.simple_form').on 'keydown', (e) ->
    # Prevent default if enter is used inside a form (key 13)
    if e.keyCode == 13
      e.preventDefault()
