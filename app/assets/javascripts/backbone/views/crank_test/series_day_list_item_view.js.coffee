CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  initialize: (options) ->

  template: JST["backbone/templates/crank_test/series_day_list_item"]

  tagName: "li"

  render: ->
    $(@el).html(@template( @model.toJSON() ))
    return this