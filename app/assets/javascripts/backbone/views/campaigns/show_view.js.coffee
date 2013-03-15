CrankTest.Views.Campaigns ||= {}

class CrankTest.Views.Campaigns.ShowView extends Backbone.View
  template: JST["backbone/templates/campaigns/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
