CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesNameView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.get('campaigns').on "reset", @render, @

  template: JST["backbone/templates/crank_test/series_name"]

  events:
    "click #save"        : "doSave"
    "click #delete"      : "doDelete"
    "click #back"        : "doBack"
    "keyup #series_name_input" : "storeName"

  render: ->
    $(@el).html( @template( @session.selectedCampaign()?.toJSON() ))
    @delegateEvents()
    return this

  storeName: (e) ->
    newName = $(e.target).val()
    @session.selectedCampaign().set 'name': newName

  doSave: ->
    @session.doSave()

  doDelete: ->
    @session.doDelete()

  doBack: -> 
    @session.doBack()