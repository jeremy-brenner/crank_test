class CrankTest.Models.Series extends Backbone.Model
  paramRoot: 'series'

  defaults:
    name: null

class CrankTest.Collections.SeriesCollection extends Backbone.Collection
  model: CrankTest.Models.Series
  url: '/series'
