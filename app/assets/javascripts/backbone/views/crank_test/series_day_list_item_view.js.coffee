CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  initialize: (options) ->
    @router = options.router
    @campaign_id = options.campaign_id

  template: JST["backbone/templates/crank_test/series_day_list_item"]

  events:
    mouseenter: "showButtons"
    mouseleave: "hideButtons"
    click: "activate"

  tagName: "li"

  render: ->
    $(@el).html(@template( @model.toJSON() ))
    return this

  showButtons: ->
    $(@el).addClass "hovered"
    $(@el).append '<img class="edit" src="/assets/edit.png">'
    $(@el).append '<img class="delete" src="/assets/delete.png">'

  hideButtons: ->
    $(@el).removeClass "hovered"
    $(@el).find('img').remove()

  activate: (e) ->
    el = $(e.srcElement)

    if el.hasClass('edit')
      @router.navigate "campaign_list/#{ @campaign_id }/day/#{ @model.get('day') }", trigger: true

    if el.hasClass('delete')
      @router.days_collection.remove @model
