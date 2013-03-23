# Session Model,  session events are bound to this as a central communication hub

class CrankTest.Models.Session extends Backbone.Model

  initialize: ->
    @on 'change:day', @updateView, @
    @on 'change:campaign_id', @updateView, @

  defaults:
    day: null
    campaign_id: null
    username: 'Matt Bradley'
    campaigns: null
    days: null
    router: null
    view: null

  day: ->
    @get('day')

  days: ->
    @get('days')

  campaign_id: -> 
    @get('campaign_id')

  campaigns: ->
    @get('campaigns')

  selectedCampaign: ->
    @campaigns().get( @campaign_id() )

  selectedDays: ->
    @days().where campaign_id: @campaign_id()

  selectedDay: ->
    day = @days().where campaign_id: @campaign_id(), day: @day() 
    if day.length > 0 
      day[0] 
    else 
      false

  updateView: ->
    @set "view", if @get('campaign_id')? then 'details_view' else 'list_view'
