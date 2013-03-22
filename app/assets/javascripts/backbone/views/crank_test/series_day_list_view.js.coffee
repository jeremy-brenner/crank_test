CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View

  initialize: (options) ->
    @router = options.router
    @router.days_collection.on "reset", @renderListElements, @
    @router.days_collection.on "add", @renderListElements, @
    @router.days_collection.on "remove", @renderListElements, @
    @on "rendered", @renderListElements, @
    @router.session_data.on "change:campaign_id", @renderListElements, @

  events:
    "click button":  "newDay"

  template: JST["backbone/templates/crank_test/series_day_list"]

  render: ->
    $(@el).html(@template())
    return this

  renderListElements: ->
    @campaign_id = @router.session_data.get('campaign_id')
    console.log "Rendering day list for campaign_id #{@campaign_id}", @router.days_collection.where({ campaign_id: @campaign_id })
    @render()
    for day in @router.days_collection.where({ campaign_id: @campaign_id })
      view = new CrankTest.Views.CrankTest.SeriesDayListItemView({ router: @router, model: day })
      el = $("#series_day_list ul").append view.render().el
    $("#series_day_list ul").append "<li><button>Add a new page</button></li>"
    return this

  newDay: ->
    @router.days_collection.newDay @campaign_id