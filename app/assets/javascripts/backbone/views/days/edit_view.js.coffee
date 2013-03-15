CrankTest.Views.Days ||= {}

class CrankTest.Views.Days.EditView extends Backbone.View
  template : JST["backbone/templates/days/edit"]

  events :
    "submit #edit-day" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (day) =>
        @model = day
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
