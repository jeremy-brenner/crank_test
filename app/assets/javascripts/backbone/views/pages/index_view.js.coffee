CrankTest.Views.Pages ||= {}

class CrankTest.Views.Pages.IndexView extends Backbone.View
  template: JST["backbone/templates/pages/index"]

  initialize: () ->
    @options.pages.bind('reset', @addAll)

  addAll: () =>
    @options.pages.each(@addOne)

  addOne: (page) =>
    view = new CrankTest.Views.Pages.PageView({model : page})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(pages: @options.pages.toJSON() ))
    @addAll()

    return this
