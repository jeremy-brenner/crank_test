CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignListView extends Backbone.View
  initialize: (options) ->
    @router      = options.router
    @router = options.router
    @router.campaigns_collection.on "reset", @renderListElements, @
    @router.campaigns_collection.on "add", @renderListElements, @
    @router.campaigns_collection.on "remove", @renderListElements, @
    @on "rendered", @renderListElements, @

  template: JST["backbone/templates/crank_test/campaign_list"]

  render: ->
    $(@el).html(@template())
    return this

  renderListElements: ->
    @render()
    for campaign in @router.campaigns_collection.models
      view = new CrankTest.Views.CrankTest.CampaignListElementView router: @router, campaign: campaign
      $("#campaign_list").append view.render().el
    view = new CrankTest.Views.CrankTest.CampaignListElementView router: @router, campaign: new Backbone.Model({ id: "new", name: "New" })
    $("#campaign_list").append view.render().el
    return this

  selectCampaign: (e) ->
    console.log e