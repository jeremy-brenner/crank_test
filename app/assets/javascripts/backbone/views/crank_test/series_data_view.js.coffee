CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDataView extends Backbone.View
  id: "series_data"

  template: JST["backbone/templates/crank_test/series_data"]

  render: ->
    $(@el).html(@template())
    return this