class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ( path ) ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    console.log "Current path: " + CrankTest.current_path
    @campaigns_collection.fetch()
    @days_collection.fetch()

  routes:
    "campaign_list"      : "campaignList"
    "campaign_list/:id"  : "campaignDetails"
    ".*"                 : "campaignList"

  campaigns_collection: new CrankTest.Collections.CampaignsCollection()
  days_collection:     new CrankTest.Collections.DaysCollection()

  campaignList: ->
    console.log "Rendering campaign list"
    @view = new CrankTest.Views.CrankTest.CampaignListView router: @
    $("#crank_test").replaceWith @view.render().el
    @view.renderListElements()

  campaignDetails: (campaign_id) ->
    console.log "Rendering campaign details for id: #{campaign_id}"
    @view = new CrankTest.Views.CrankTest.CampaignDetailsView router: @, campaign_id: campaign_id
    $("#crank_test").replaceWith @view.render().el 
    @view.renderSubViews()
