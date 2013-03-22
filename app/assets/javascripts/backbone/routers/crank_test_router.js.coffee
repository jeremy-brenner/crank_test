class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    @campaigns_collection.fetch()
    @days_collection.fetch()

  routes:
    "campaign_list/:campaign_id"           : "campaignDetails"
    "campaign_list/:campaign_id/day/:day"  : "campaignDetailsDay"
    "campaign_list"                        : "campaignList"
    ".*"                                   : "campaignList"

  campaigns_collection: new CrankTest.Collections.CampaignsCollection()
  days_collection:      new CrankTest.Collections.DaysCollection()
  session_data:         new Backbone.Model();

  campaignList: ->
    console.log "Rendering campaign list"
    @list_view ||= new CrankTest.Views.CrankTest.CampaignListView router: @
    $('#crank_test').html @list_view.render().el
    @list_view.renderListElements()

  campaignDetails: ( campaign_id ) ->
    @session_data.set campaign_id: campaign_id
    console.log "Rendering campaign details for id: #{campaign_id}"
    @details_view ||= new CrankTest.Views.CrankTest.CampaignDetailsView router: @
    $('#crank_test').html @details_view.render().el 
    @details_view.renderSubViews()

  campaignDetailsDay: ( campaign_id, day ) ->
    @session_data.set campaign_id: campaign_id, day: day
    console.log "Rendering campaign details for id: #{campaign_id}, day: #{day}"
    @campaignDetails(campaign_id)
