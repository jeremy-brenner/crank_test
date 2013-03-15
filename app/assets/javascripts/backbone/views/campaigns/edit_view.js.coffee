CrankTest.Views.Campaigns ||= {}

class CrankTest.Views.Campaigns.EditView extends Backbone.View
  template : JST["backbone/templates/campaigns/edit"]

  events :
    "submit #edit-campaign" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (campaign) =>
        @model = campaign
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
