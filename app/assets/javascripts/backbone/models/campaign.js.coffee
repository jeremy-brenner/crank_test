class CrankTest.Models.Campaign extends Backbone.Model
  paramRoot: 'campaign'

  defaults:
    name: null

class CrankTest.Collections.CampaignsCollection extends Backbone.Collection
  model: CrankTest.Models.Campaign
  url: '/campaigns'
