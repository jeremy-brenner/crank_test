CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesEmailView extends Backbone.View
  id: "series_email"

  template: JST["backbone/templates/crank_test/series_email"]

  render: ->
    $(@el).html(@template())
    return this