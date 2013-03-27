CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListItemView extends Backbone.View
  initialize: (options) ->
    @session = CrankTest.App.session
    @session.on "change:day"    , @activateTab  , @
    @model.on   "change:subject", @updateSubject, @
    @model.on   "change:day"    , @updateDay    , @

  template: JST["backbone/templates/crank_test/series_day_list_item"]

  events:
    mouseenter: "showButtons"
    mouseleave: "hideButtons"
    "click .edit":   "doEdit"
    "click .delete": "doDelete"

  tagName: "li"

  render: ->
    @$el.html(@template( @model.toJSON() ))
    @activateTab()
    @delegateEvents()
    return this
  
  activateTab: ->
    if @active() then @$el.addClass "active" else @$el.removeClass "active"

  active: ->
    parseInt( @model.get('day') ) == parseInt( @session.day() )

  showButtons: ->
    @$el.addClass "hovered"
    @$el.find('div').append '<img class="edit" src="/assets/edit.png">'
    @$el.find('div').append '<img class="delete" src="/assets/delete.png">'

  hideButtons: ->
    @$el.removeClass "hovered"
    @$el.find('div > img').remove()

  updateSubject: ->
    @$el.find(".series_subject").text @model.get('subject') 

  updateDay: ->
    @$el.find(".series_day").text "Day #{@model.get('day')}" 
    console.log 'calling sort'
    @session.days().sort()

  doEdit: (e) ->
    campaign_id = @session.campaignId()
    @session.set 'day': @model.get('day') 

  doDelete: (e) ->
    campaign_id = @session.campaignId()
    @session.days().remove @model

