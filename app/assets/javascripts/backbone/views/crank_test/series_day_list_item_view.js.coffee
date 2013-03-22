CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  initialize: (options) ->
    @router = options.router

  template: JST["backbone/templates/crank_test/series_day_list_item"]

  events:
    mouseenter: "showButtons"
    mouseleave: "hideButtons"
    click: "doClick"

  tagName: "li"

  render: ->
    $(@el).html(@template( @model.toJSON() ))
    if @active() then $(@el).addClass "active"
    return this

  active: ->
    parseInt( @model.get('day') ) == parseInt( @router.session_data.get('day') )

  showButtons: ->
    $(@el).addClass "hovered"
    $(@el).append '<img class="edit" src="/assets/edit.png">'
    $(@el).append '<img class="delete" src="/assets/delete.png">'

  hideButtons: ->
    $(@el).removeClass "hovered"
    $(@el).find('img').remove()

  doClick: (e) ->
    campaign_id = @router.session_data.get("campaign_id")
    el = $(e.srcElement)

    if el.hasClass('edit')
      @router.navigate "campaign_list/#{ campaign_id }/day/#{ @model.get('day') }", trigger:true

    if el.hasClass('delete')
      @router.days_collection.remove @model
