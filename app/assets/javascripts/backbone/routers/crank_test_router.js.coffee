class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ( path ) ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    console.log "Current path: " + CrankTest.current_path
    @campaign_collection.fetch()
    @days_collection.fetch()


  routes:
    "campaign_list"      : "campaignList"
    "campaign_list/:id"  : "campaignDetails"
    ".*"                 : "campaignList"

  campaign_collection: new CrankTest.Collections.CampaignsCollection()
  days_collection:     new CrankTest.Collections.DaysCollection()

  campaignList: ->
    console.log "Rendering campaignList"
   # @view = new CrankTest.Views.CrankTest.CampaignDetailsView()
   # $("#crank_test").html(@view.render().el)

  campaignDetails: (campaign_id) ->
    console.log "Rendering campaign details for id: #{campaign_id}"
    @view = new CrankTest.Views.CrankTest.CampaignDetailsView router: @, campaign_id: campaign_id
    $("#crank_test").replaceWith @view.render().el 
    @view.renderSubViews()
