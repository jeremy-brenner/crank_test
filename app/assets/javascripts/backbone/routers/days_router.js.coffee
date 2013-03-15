class CrankTest.Routers.DaysRouter extends Backbone.Router
  initialize: (options) ->
    @days = new CrankTest.Collections.DaysCollection()
    @days.reset options.days

  routes:
    "new"      : "newDay"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newDay: ->
    @view = new CrankTest.Views.Days.NewView(collection: @days)
    $("#days").html(@view.render().el)

  index: ->
    @view = new CrankTest.Views.Days.IndexView(days: @days)
    $("#days").html(@view.render().el)

  show: (id) ->
    day = @days.get(id)

    @view = new CrankTest.Views.Days.ShowView(model: day)
    $("#days").html(@view.render().el)

  edit: (id) ->
    day = @days.get(id)

    @view = new CrankTest.Views.Days.EditView(model: day)
    $("#days").html(@view.render().el)
