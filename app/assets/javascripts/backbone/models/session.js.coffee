# Session Model,  session events are bound to this as a central communication hub

class CrankTest.Models.Session extends Backbone.Model

  defaults:
    day: false
    campaign_id: false
    username: 'Matt Bradley'
    campaigns: null
    days: null
    router: null

  day: ->
    @get('day')

  campaign_id: -> 
    @get('campaign_id')

  campaigns: ->
    @get('campaigns')

  selectedCampaign: ->
    @campaigns().get( @campaign_id() )?.toJSON()

  selectedDay: ->
  