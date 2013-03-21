class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ( path ) ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    console.log "Current path: " + CrankTest.current_path;

  routes:
    "campaign_list"      : "campaignList"
    "campaign_list/:id"   : "campaignDetails"
    ".*"                 : "campaignList"

  campaignList: ->
    console.log "Rendering campaignList"
   # @view = new CrankTest.Views.CrankTest.CampaignDetailsView()
   # $("#crank_test").html(@view.render().el)

  campaignDetails: (id) ->
    console.log "Rendering campaign details for id: #{id}"
    @view = new CrankTest.Views.CrankTest.CampaignDetailsView()
    $("#crank_test").html(@view.render().el)
