CrankTest.Views.Series ||= {}

class CrankTest.Views.Series.EditView extends Backbone.View
  template : JST["backbone/templates/series/edit"]

  events :
    "submit #edit-series" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (series) =>
        @model = series
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
