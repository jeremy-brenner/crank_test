class CrankTest.Models.Day extends Backbone.Model
  paramRoot: 'day'

  defaults:
    day: null
    subject: null
    message: null
    send_time: null
    send_zone: null
    campaign_id: null

class CrankTest.Collections.DaysCollection extends Backbone.Collection
  model: CrankTest.Models.Day
  url: '/days'
