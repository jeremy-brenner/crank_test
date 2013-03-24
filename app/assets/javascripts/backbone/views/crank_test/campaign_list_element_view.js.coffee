CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignListElementView extends Backbone.View

  tagName: "li"

  events:
    "click":  "selectCampaign"

  initialize: (options) ->
    @session = CrankTest.App.session
    @campaign = options.campaign
    @campaign.on "change", @render, @

  template: JST["backbone/templates/crank_test/campaign_list_element"]

  render: ->
    $(@el).html(@template( @campaign.toJSON() ))
    @delegateEvents()
    return this

  selectCampaign: ->
    selected = if @campaign.get('id') == "new"
      m = new CrankTest.Models.Campaign()
      @session.campaigns().add(m)
      m.cid
    else
      @campaign.get 'id'
    
    @session.set campaign_id: selected