CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignDetailsView extends Backbone.View
  initialize: (options) ->
    @campaign_id = options.campaign_id
    @router = options.router

  id: "crank_test"

  template: JST["backbone/templates/crank_test/campaign_details"]

  subviews: [
    id: 'series_name'
    className: 'SeriesNameView'
    view: false
  ,
    id: 'series_day_list'
    className: 'SeriesDayListView'
    view: false
  ,  
    id: 'series_email'
    className: 'SeriesEmailView'
    view: false
  ,
    id: 'series_data'
    className: 'SeriesDataView'
    view: false
  ]

  render: ->
    $(@el).html(@template())
    return this

  renderSubViews: ->
    for subview in @subviews
      subview.view = new CrankTest.Views.CrankTest[ subview.className ] router: @router, campaign_id: @campaign_id
      $("\##{subview.id}").replaceWith subview.view.render().el
