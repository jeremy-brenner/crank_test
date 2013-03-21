CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesNameView extends Backbone.View
  id: "series_name"

  template: JST["backbone/templates/crank_test/series_name"]

  render: ->
    $(@el).html(@template())
    return this