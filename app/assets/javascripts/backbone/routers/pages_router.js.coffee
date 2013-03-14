class CrankTest.Routers.PagesRouter extends Backbone.Router
  initialize: (options) ->
    @pages = new CrankTest.Collections.PagesCollection()
    @pages.reset options.pages

  routes:
    "new"      : "newPage"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPage: ->
    @view = new CrankTest.Views.Pages.NewView(collection: @pages)
    $("#pages").html(@view.render().el)

  index: ->
    @view = new CrankTest.Views.Pages.IndexView(pages: @pages)
    $("#pages").html(@view.render().el)

  show: (id) ->
    page = @pages.get(id)

    @view = new CrankTest.Views.Pages.ShowView(model: page)
    $("#pages").html(@view.render().el)

  edit: (id) ->
    page = @pages.get(id)

    @view = new CrankTest.Views.Pages.EditView(model: page)
    $("#pages").html(@view.render().el)
