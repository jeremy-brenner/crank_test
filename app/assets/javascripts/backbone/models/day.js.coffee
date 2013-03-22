class CrankTest.Models.Day extends Backbone.Model
  paramRoot: 'day'

  defaults:
    day: 0
    subject: 'New'
    message: ''
    send_time: ''
    send_zone: ''
    campaign_id: null

class CrankTest.Collections.DaysCollection extends Backbone.Collection
  model: CrankTest.Models.Day
  url: '/days'

  nextDay: (campaign_id) ->
    last = _.max @where({ campaign_id:campaign_id }), (day) -> day.get('day')
    if typeof last == "number"
      1
    else
      last.get('day') + 1

  newDay: (campaign_id) ->
    next_day = @nextDay(campaign_id) 
    @add day: next_day, campaign_id: campaign_id
