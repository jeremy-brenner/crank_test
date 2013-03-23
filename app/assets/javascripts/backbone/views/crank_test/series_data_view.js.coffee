CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDataView extends Backbone.View
  initialize: (options) ->
    @router      = options.router


  template: JST["backbone/templates/crank_test/series_data"]

  setup: ->
    @campaign_id = @router.session_data.get('campaign_id')
    @day         = @router.session_data.get('day')
    

  render: ->
    @setup()
    console.log "YOYO", @campaign_id, @day, @model, @router.days_collection
    if @model
      $(@el).html(@template( @model.toJSON() ))

    return this