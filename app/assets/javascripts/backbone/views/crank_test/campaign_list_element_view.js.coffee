CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignListElementView extends Backbone.View

  tagName: "li"

  events:
    "click":  "selectCampaign"

  initialize: (options) ->
    @session = options.session
    @campaign = options.campaign
    @campaign.on "change", @render, @

  template: JST["backbone/templates/crank_test/campaign_list_element"]

  render: ->
    $(@el).html(@template( @campaign.toJSON() ))
    return this

  selectCampaign: ->
    @session.set campaign_id: @campaign.get('id')