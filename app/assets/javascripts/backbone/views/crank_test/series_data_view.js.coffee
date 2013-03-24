CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDataView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day", @render, @

  template: JST["backbone/templates/crank_test/series_data"]

  events: ->
    "keyup #subject": "storeSubject"
    "keyup #message": "storeMessage"

  storeSubject: (e) ->
    @model.set 'subject': $(e.target).val() 

  storeMessage: (e) ->
    @model.set 'message': $(e.target).val() 

  render: ->
    if @session.selectedDay()
      @model = @session.selectedDay()
      @$el.html( @template( @model.toJSON() ))
    else 
      @$el.html("")
    @delegateEvents()
    return this