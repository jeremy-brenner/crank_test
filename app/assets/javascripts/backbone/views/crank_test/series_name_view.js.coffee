CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesNameView extends Backbone.View
  initialize: (options) ->
    @router = options.router
    @router.campaigns_collection.on "reset", @render, @

  template: JST["backbone/templates/crank_test/series_name"]

  render: ->
    $(@el).html( @template( @router.campaigns_collection.get(@router.session_data.get('campaign_id'))?.toJSON() ))
    return this