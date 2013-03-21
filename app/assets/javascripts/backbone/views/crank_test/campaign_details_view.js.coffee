CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.CampaignDetailsView extends Backbone.View
  template: JST["backbone/templates/crank_test/campaign_details"]

  render: ->
    $(@el).html(@template())
    return this