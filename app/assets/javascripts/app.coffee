window.App ||= {}

$(document).on 'turbolinks:load', ->
  #$('.calendar').calendar({ type: 'date' }) //TODO: Bug, fix it
  #$('.timedatepicker').calendar({ type: 'datetime' })
  $('.ui.dropdown').dropdown()
  $('.dropdown-allow-additions').dropdown({ allowAdditions: true })
