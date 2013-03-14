CrankTest.Views.Series ||= {}

class CrankTest.Views.Series.SeriesView extends Backbone.View
  template: JST["backbone/templates/series/series"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
