# Session Model,  session events are bound to this as a central communication hub

class CrankTest.Models.Session extends Backbone.Model

  initialize: ->
    @on 'change:day', @updateView, @
    @on 'change:campaign_id', @updateView, @
    @on 'change:campaign_id', @setDayTriggers, @

  defaults:
    day: null
    campaign_id: null
    username: 'Matt Bradley'
    campaigns: null
    days: null
    router: null
    view: null

  day: (day=null) ->
    if day?
      @set 'day': day
    @get('day')

  router: ->
    @get('router')

  days: ->
    @get('days')

  campaignId: -> 
    @get('campaign_id')

  campaigns: ->
    @get('campaigns')

  selectedCampaign: ->
    @campaigns().get( @campaignId() )

  selectedDays: ->
    @days().byCampaignId( @campaignId() )

  selectedDay: ->
    @days().byCampaignIdAndDay( @campaignId(), @day() )

  updateView: ->
    @set "view", if @get('campaign_id')? then 'details_view' else 'list_view'

  setDayTriggers: ->
    console.log "setting day trigger"
    @days().on 'remove', @checkAndFixDay, @

  checkAndFixDay: ->
    unless @selectedDay()? 
      @day @days().last()?.get('day')

  doSave: ->
    @selectedCampaign().save( null, { success: @saveDays } ) 

  saveDays: (campaign) =>
    day.save({campaign_id:campaign.id}) for day in @selectedDays()
    @doBack()


  doDelete: ->
    for day in @selectedDays()
      day.destroy()
    @selectedCampaign().destroy()
    @doBack()

  doBack: -> 
    @router().campaignList()

