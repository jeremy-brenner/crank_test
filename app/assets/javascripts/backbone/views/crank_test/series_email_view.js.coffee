CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @campaign_id = options.campaign_id
    @router = options.router
    @router.campaigns_collection.on "reset", @render, @

  id: "series_email"

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html( @template( @router.campaigns_collection.get(@campaign_id)?.toJSON() ) )
    return this