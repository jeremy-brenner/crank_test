CrankTest.Views.Days ||= {}

class CrankTest.Views.Days.ShowView extends Backbone.View
  template: JST["backbone/templates/days/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
