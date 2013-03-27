CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View

  initialize: (options) ->
    @session = CrankTest.App.session
    @session.days().on "add remove sort reset", @renderListElements, @
    @on "rendered", @renderListElements, @
    @session.on "change:campaign_id", @renderListElements, @

  events:
    "click button":  "newDay"

  template: JST["backbone/templates/crank_test/series_day_list"]

  render: ->
    $(@el).html(@template())
    @delegateEvents()
    return this

  renderListElements: ->
    @render()
    for day in @session.selectedDays()
      view = new CrankTest.Views.CrankTest.SeriesDayListItemView({ model: day })
      el = $("#series_day_list ul").append view.render().el
    $("#series_day_list ul").append "<li><div class='add_page_button'><button>Add a new page</button></div></li>"
    return this

  newDay: ->
    console.log "new day clicked"
    @session.days().newDay @session.campaignId()