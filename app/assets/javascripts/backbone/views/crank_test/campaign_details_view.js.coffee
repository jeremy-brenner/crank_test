CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignDetailsView extends Backbone.View
  initialize: (options) ->
    @on "rendered", @renderSubViews, @

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
      subview.view ||= new CrankTest.Views.CrankTest[ subview.className ] 
      $("\##{subview.id}").html subview.view.render().el
      subview.view.trigger "rendered"
