# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



jQuery ->

  # Hack the left buttons so they press.. does nothing.
  $('div.leftnav > ul > li').on 'click', (e) ->
    $(e.currentTarget.parentElement).children().removeClass 'active'
    $(e.currentTarget).addClass 'active' 
    if $(e.currentTarget).text() == "Campaigns"
      $('#crank_test').show()
    else
      $('#crank_test').hide()
