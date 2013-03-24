CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day", @render, @

  events: ->
    "keyup #day_input": "storeDay"
    "click .time li"  : "storeTime"
    "click .zone li"  : "storeZone"

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html( @template( @session.selectedCampaign()?.toJSON() ) )
    @delegateEvents()
    return this

  storeDay: (e) ->
    newDay = $(e.target).val()
    @current_day.set 'day': newDay

  storeTime: (e) ->
    newTime = $(e.target).html()
    @current_day.set 'send_time': newTime

  storeZone: (e) ->
    newZone = $(e.target).html()
    @current_day.set 'send_zone': newZone

  render: ->
    if @session.selectedDay()
      @current_day = @session.selectedDay()
      @$el.html( @template( @current_day.toJSON() ))
      @current_day.on "change:send_time", @render, @
      @current_day.on "change:send_zone", @render, @
    else 
      @$el.html("")

    return this