CrankTest.Views.Series ||= {}

class CrankTest.Views.Series.ShowView extends Backbone.View
  template: JST["backbone/templates/series/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
