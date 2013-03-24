CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    
    @model.on "change:subject", @updateSubject, @
    @model.on "change:day"    , @updateDay    , @

  template: JST["backbone/templates/crank_test/series_day_list_item"]

  events:
    mouseenter: "showButtons"
    mouseleave: "hideButtons"
    click: "doClick"

  tagName: "li"

  render: ->
    @$el.html(@template( @model.toJSON() ))
    if @active() then @$el.addClass "active"
    return this

  active: ->
    parseInt( @model.get('day') ) == parseInt( @session.day() )

  showButtons: ->
    @$el.addClass "hovered"
    @$el.append '<img class="edit" src="/assets/edit.png">'
    @$el.append '<img class="delete" src="/assets/delete.png">'

  hideButtons: ->
    @$el.removeClass "hovered"
    @$el.find('img').remove()

  updateSubject: ->
    @$el.find(".series_subject").text( @model.get('subject') )

  updateDay: ->
    @$el.find(".series_day").text( "Day #{@model.get('day')}" )

  doClick: (e) ->
    campaign_id = @session.campaign_id()
    el = $(e.srcElement)

    if el.hasClass('edit')
      @session.set('day', @model.get('day') )

    if el.hasClass('delete')
      @session.days().remove @model
