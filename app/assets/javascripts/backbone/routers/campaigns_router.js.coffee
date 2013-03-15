class CrankTest.Routers.CampaignsRouter extends Backbone.Router
  initialize: (options) ->
    @campaigns = new CrankTest.Collections.CampaignsCollection()
    @campaigns.reset options.campaigns

  routes:
    "new"      : "newCampaign"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newCampaign: ->
    @view = new CrankTest.Views.Campaigns.NewView(collection: @campaigns)
    $("#campaigns").html(@view.render().el)

  index: ->
    @view = new CrankTest.Views.Campaigns.IndexView(campaigns: @campaigns)
    $("#campaigns").html(@view.render().el)

  show: (id) ->
    campaign = @campaigns.get(id)

    @view = new CrankTest.Views.Campaigns.ShowView(model: campaign)
    $("#campaigns").html(@view.render().el)

  edit: (id) ->
    campaign = @campaigns.get(id)

    @view = new CrankTest.Views.Campaigns.EditView(model: campaign)
    $("#campaigns").html(@view.render().el)
