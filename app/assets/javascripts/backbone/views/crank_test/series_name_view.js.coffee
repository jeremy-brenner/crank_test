CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesNameView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.get('campaigns').on "reset", @render, @

  template: JST["backbone/templates/crank_test/series_name"]

  render: ->
    $(@el).html( @template( @session.currentCampaign() ))
    return this