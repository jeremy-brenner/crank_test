CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  template: JST["backbone/templates/crank_test/series_day_list_item"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this