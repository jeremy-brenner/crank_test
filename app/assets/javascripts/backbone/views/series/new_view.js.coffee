CrankTest.Views.Series ||= {}

class CrankTest.Views.Series.NewView extends Backbone.View
  template: JST["backbone/templates/series/new"]

  events:
    "submit #new-series": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (series) =>
        @model = series
        window.location.hash = "/#{@model.id}"

      error: (series, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
