CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDataView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day", @render, @

  template: JST["backbone/templates/crank_test/series_data"]

  events: ->
    "keyup #subject": "changeSubject"

  changeSubject: (e) ->
    day = @session.selectedDay()
    console.log "changing subject on day: ", day, $(e.target).val()
    day.set('subject', $(e.target).val() )
    true

  render: ->
    if @session.selectedDay()
      @$el.html( @template( @session.selectedDay().toJSON() ))
    else 
      @$el.html("")

    return this