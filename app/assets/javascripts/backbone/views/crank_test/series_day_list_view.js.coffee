CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDayListView extends Backbone.View
    render: ->
      $(@el).html(@template(@model.toJSON() ))
      return this
