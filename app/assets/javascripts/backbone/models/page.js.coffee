class CrankTest.Models.Page extends Backbone.Model
  paramRoot: 'page'

  defaults:
    day: null
    subject: null
    message: null
    send_time: null
    send_zone: null

class CrankTest.Collections.PagesCollection extends Backbone.Collection
  model: CrankTest.Models.Page
  url: '/pages'
