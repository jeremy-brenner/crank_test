CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View

  initialize: (options) ->
    @session = CrankTest.App.session
    @session.get('days').on "reset", @renderListElements, @
    @session.get('days').on "add", @renderListElements, @
    @session.get('days').on "remove", @renderListElements, @
    @on "rendered", @renderListElements, @
    @session.on "change:campaign_id", @renderListElements, @

  events:
    "click button":  "newDay"

  template: JST["backbone/templates/crank_test/series_day_list"]

  render: ->
    $(@el).html(@template())
    return this

  renderListElements: ->
    @campaign_id = @session.get('campaign_id')
    console.log "Rendering day list for campaign_id #{@campaign_id}", @session.get('days').where({ campaign_id: @campaign_id })
    @render()
    for day in @session.selectedDays()
      view = new CrankTest.Views.CrankTest.SeriesDayListItemView({ model: day })
      el = $("#series_day_list ul").append view.render().el
    $("#series_day_list ul").append "<li><button>Add a new page</button></li>"
    return this

  newDay: ->
    @session.days().newDay @campaign_id