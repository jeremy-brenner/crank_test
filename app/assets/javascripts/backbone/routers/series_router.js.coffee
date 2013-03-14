class CrankTest.Routers.SeriesRouter extends Backbone.Router
  initialize: (options) ->
    @series = new CrankTest.Collections.SeriesCollection()
    @series.reset options.series

  routes:
    "new"      : "newSeries"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newSeries: ->
    @view = new CrankTest.Views.Series.NewView(collection: @series)
    $("#series").html(@view.render().el)

  index: ->
    @view = new CrankTest.Views.Series.IndexView(series: @series)
    $("#series").html(@view.render().el)

  show: (id) ->
    series = @series.get(id)

    @view = new CrankTest.Views.Series.ShowView(model: series)
    $("#series").html(@view.render().el)

  edit: (id) ->
    series = @series.get(id)

    @view = new CrankTest.Views.Series.EditView(model: series)
    $("#series").html(@view.render().el)
