CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View

  initialize: (options) ->
    @router = options.router
    @campaign_id = options.campaign_id
    @router.days_collection.on "reset", @renderListElements, @
    @router.days_collection.on "add", @renderListElements, @
    @router.days_collection.on "remove", @renderListElements, @

  events:
    "click button":  "newDay"
  
  tagName: "div"

  id:"series_day_list"

  template: JST["backbone/templates/crank_test/series_day_list"]

  render: ->
    $(@el).html(@template())
    return this

  renderListElements: ->
    console.log "Rendering day list"
    @render()
    for day in @router.days_collection.where({ campaign_id: @campaign_id })
      view = new CrankTest.Views.CrankTest.SeriesDayListItemView({ campaign_id: @campaign_id, router: @router, model: day })
      $("#series_day_list > ul").append view.render().el
    
    $("#series_day_list > ul").append "<li><button>Add a new page</button></li>"
    return this

  newDay: ->
    @router.days_collection.newDay @campaign_id 