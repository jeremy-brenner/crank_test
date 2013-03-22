#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.CrankTest =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  App: {}

jQuery ->
  CrankTest.App.crank_test_router = new CrankTest.Routers.CrankTestRouter 
  Backbone.history.start pushState: true
