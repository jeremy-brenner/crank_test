CrankTest.Views.Days ||= {}

class CrankTest.Views.Days.IndexView extends Backbone.View
  template: JST["backbone/templates/days/index"]

  initialize: () ->
    @options.days.bind('reset', @addAll)

  addAll: () =>
    @options.days.each(@addOne)

  addOne: (day) =>
    view = new CrankTest.Views.Days.DayView({model : day})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(days: @options.days.toJSON() ))
    @addAll()

    return this
