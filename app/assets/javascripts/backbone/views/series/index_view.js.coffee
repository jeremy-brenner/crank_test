CrankTest.Views.Series ||= {}

class CrankTest.Views.Series.IndexView extends Backbone.View
  template: JST["backbone/templates/series/index"]

  initialize: () ->
    @options.series.bind('reset', @addAll)

  addAll: () =>
    @options.series.each(@addOne)

  addOne: (series) =>
    view = new CrankTest.Views.Series.SeriesView({model : series})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(series: @options.series.toJSON() ))
    @addAll()

    return this
