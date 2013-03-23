CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @campaign_id = @session.get('campaign_id')
    @session.campaigns().on "reset", @render, @

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html( @template( @session.selectedCampaign()?.toJSON() ) )
    return this