class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    @buildSession().buildViews()
    @session.on 'change:day'        , @changeDay     , @
    @session.on 'change:campaign_id', @changeCampaign, @

  routes:
    "campaign_list/:campaign_id"           : "campaignDetails"
    "campaign_list/:campaign_id/day/:day"  : "campaignDetailsDay"
    "campaign_list"                        : "campaignList"
    ".*"                                   : "campaignList"


  buildSession: ->
    @session = new CrankTest.Models.Session
      router     : @
      days       : new CrankTest.Collections.DaysCollection()
      campaigns  : new CrankTest.Collections.CampaignsCollection()
    @session.get('days').fetch();
    @session.get('campaigns').fetch();
    CrankTest.App.session = @session;
    @

  buildViews: ->
    @list_view    = new CrankTest.Views.CrankTest.CampaignListView()
    @details_view = new CrankTest.Views.CrankTest.CampaignDetailsView()
    @

  campaignList: ->
    console.log "Rendering campaign list"
    $('#crank_test').html @list_view.render().el
    @list_view.renderListElements()

  campaignDetails: ( campaign_id ) ->
    @session_data.set campaign_id: campaign_id
    console.log "Rendering campaign details for id: #{campaign_id}"
    $('#crank_test').html @details_view.render().el 
    @details_view.renderSubViews()

  campaignDetailsDay: ( campaign_id, day ) ->
    @session_data.set campaign_id: campaign_id, day: day
    console.log "Rendering campaign details for id: #{campaign_id}, day: #{day}"
    @campaignDetails(campaign_id)

  changeDay: ->
    console.log "New day! #{ @session.day() }"
  changeCampaign: ->
    console.log "New Campaign id! #{ @session.campaign_id() }"