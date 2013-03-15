CrankTest.Views.Days ||= {}

class CrankTest.Views.Days.DayView extends Backbone.View
  template: JST["backbone/templates/days/day"]

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
