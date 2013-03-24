CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day", @render, @

  events: ->
    "keyup #day_input": "changeDay"

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html( @template( @session.selectedCampaign()?.toJSON() ) )
    return this


  changeDay: (e) ->
    newDay = $(e.target).val()
    @current_day.set 'day': newDay


  render: ->
    if @session.selectedDay()
      @current_day = @session.selectedDay()
      @$el.html( @template( @current_day.toJSON() ))
    else 
      @$el.html("")

    return this