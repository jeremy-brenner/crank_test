CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDataView extends Backbone.View
  initialize: (options) ->
    @router      = options.router
    @campaign_id = @router.session_data.get('campaign_id')
    @day         = @router.session_data.get('day')
    @model       = @router.days_collection.where( campaign_id: @campaign_id, day: @day )[0]

  template: JST["backbone/templates/crank_test/series_data"]

  render: ->
    return this unless @model
    $(@el).html(@template( @model.toJSON() ))
    return this