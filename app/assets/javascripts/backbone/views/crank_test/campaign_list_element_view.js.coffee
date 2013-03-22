CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignListElementView extends Backbone.View

  tagName: "li"

  events:
    "click":  "selectCampaign"

  initialize: (options) ->
    @router = options.router
    @campaign = options.campaign
    @campaign.on "change", @render, @

  template: JST["backbone/templates/crank_test/campaign_list_element"]

  render: ->
    $(@el).html(@template( @campaign.toJSON() ))
    return this

  selectCampaign: ->
    @router.navigate "campaign_list/#{ @campaign.get('id') }", trigger: true