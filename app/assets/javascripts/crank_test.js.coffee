# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

console.log """
              === Starting Crank Apps Test ===
              All app objects can be found under the CrankTest namespace
            """

jQuery ->
  $('div.leftnav > ul > li').on 'click', (e) ->
    $(e.currentTarget.parentElement).children().removeClass 'active'
    $(e.currentTarget).addClass 'active' 

   