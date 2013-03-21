CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View
  id: "series_day_list"

  template: JST["backbone/templates/crank_test/series_day_list"]

  render: ->
    $(@el).html(@template())
    return this