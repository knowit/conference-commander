window.App ||= {}

$(document).on 'turbolinks:load', ->
  $('.calendar').calendar({ type: 'date' })
  $('.timedatepicker').calendar({ type: 'datetime' })
  $('.ui.dropdown').dropdown()
  $('.dropdown-allow-additions').dropdown({ allowAdditions: true })
