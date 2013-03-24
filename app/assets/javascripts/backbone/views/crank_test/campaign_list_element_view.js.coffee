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
    @session.set campaign_id: @campaign.get('id')