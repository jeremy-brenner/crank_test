class CrankTest.Routers.CrankTestRouter extends Backbone.Router
  initialize: ->
    console.log """
                  === Starting Crank Apps Test ===
                  All app objects can be found under the CrankTest namespace
                """
    @buildSession().buildViews()
    @session.on 'change:day'        , @updateNav , @
    @session.on 'change:campaign_id', @updateNav , @    
    @session.on 'change:view'       , @changeView, @

  routes:
    "campaign_list/:campaign_id(/day/:day)"  : "campaignDetails"
    ".*"                                     : "campaignList"

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
    @views =
      list_view    : new CrankTest.Views.CrankTest.CampaignListView()
      details_view : new CrankTest.Views.CrankTest.CampaignDetailsView()
    @

  campaignList: ->
    @session.set campaign_id: null, day: null, view: 'list_view'

  campaignDetails: ( campaign_id, day=null ) ->
    @session.set campaign_id: campaign_id, day: day

  updateNav: ->
    campaign_id = @session.get("campaign_id")
    day         = @session.get("day")

    path = if campaign_id? and day?
      "campaign_list/#{campaign_id}/day/#{day}"
    else if campaign_id?
      "campaign_list/#{campaign_id}"
    else
      ""
    @navigate path

  changeCampaign: ->
    console.log "New Campaign id! #{ @session.campaign_id() }"

  changeView: (e) ->
    console.log "Switching from view #{ e._previousAttributes.view } to #{e.attributes.view}"
    $('#crank_test').html @views[ e.attributes.view ].render().el
    @views[ e.attributes.view ].trigger 'rendered'