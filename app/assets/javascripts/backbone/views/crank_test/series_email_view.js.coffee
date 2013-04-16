CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.days().on "reset", @render, @
    @session.on "change:day", @render, @    

  events: ->
    "keyup #day_input": "storeDay"
    "click .time li"  : "storeTime"
    "click .zone li"  : "storeZone"

  template: JST["backbone/templates/crank_test/series_email"]

  storeDay: (e) ->
    newDay = $(e.target).val()
    @current_day.set 'day': newDay

  storeTime: (e) ->
    console.log "storeDay"
    newTime = $(e.target).data('value')
    @current_day.set 'send_time': newTime

  storeZone: (e) ->
    console.log "storeZone"
    newZone = $(e.target).html()
    @current_day.set 'send_zone': newZone

  render: ->
    if @session.selectedDay()
      @current_day = @session.selectedDay()
      @$el.html( @template( { day: @current_day } ))
      @current_day.on "change:send_time change:send_zone", @render, @
      @delegateEvents()
    else 
      @$el.html("")

    return this