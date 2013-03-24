class CrankTest.Models.Day extends Backbone.Model
  paramRoot: 'day'

  defaults:
    day: 0
    subject: 'New'
    message: ''
    send_time: '9'
    send_zone: 'EST'
    campaign_id: null

  humanTime: ->
    if @get('send_time') < 12
      "#{@get('send_time')}am"
    else
      "#{@get('send_time')-12}pm"

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
