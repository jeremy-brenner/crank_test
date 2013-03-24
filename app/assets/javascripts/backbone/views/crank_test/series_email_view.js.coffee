CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day", @render, @

  events: ->
    "keyup #day_input": "changeDay"
    "click .time li": "timeClicked"
    "click .zone li": "zoneClicked"

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html( @template( @session.selectedCampaign()?.toJSON() ) )
    return this

  changeDay: (e) ->
    newDay = $(e.target).val()
    @current_day.set 'day': newDay

  timeClicked: (e) ->
    newTime = $(e.target).html()
    @current_day.set 'send_time': newTime

  zoneClicked: (e) ->
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