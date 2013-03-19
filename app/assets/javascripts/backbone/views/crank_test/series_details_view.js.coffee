CrankTest.Views.CrankTest ||= {}

class CrankTest.Views.CrankTest.SeriesDetailsView extends Backbone.View
  template: JST["backbone/templates/crank_test/series_details"]

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      @render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (campaign) =>
        @model = campaign
        window.location.hash = "/#{@model.id}"

      error: (campaign, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    @$("form").backboneLink(@model)

    return @
