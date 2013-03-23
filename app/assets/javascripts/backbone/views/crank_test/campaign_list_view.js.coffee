CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignListView extends Backbone.View
  initialize: (options) ->
    @session      = CrankTest.App.session
    @campaigns = @session.get "campaigns"
    @campaigns.on "reset"   , @renderSubViews, @
    @campaigns.on "add"     , @renderSubViews, @
    @campaigns.on "remove"  , @renderSubViews, @
    @on           "rendered", @renderSubViews, @

  template: JST["backbone/templates/crank_test/campaign_list"]

  render: ->
    $(@el).html(@template())
    return this

  renderSubViews: ->
    @render()
    for campaign in @campaigns.models
      view = new CrankTest.Views.CrankTest.CampaignListElementView session: @session, campaign: campaign
      $("#campaign_list").append view.render().el
    view = new CrankTest.Views.CrankTest.CampaignListElementView session: @session, campaign: new Backbone.Model({ id: "new", name: "New" })
    $("#campaign_list").append view.render().el
    return this

  selectCampaign: (e) ->
    console.log e