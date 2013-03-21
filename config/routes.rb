CrankTest::Application.routes.draw do 

  # routes to mockup pages
  match '/campaigns_mockup', to: 'crank_test#campaigns_mockup'  
  match '/campaign_details_mockup', to: 'crank_test#campaign_details_mockup'

  # REST data resources
  resources :days
  resources :campaigns

  mount JasmineRails::Engine => "/specs" unless Rails.env.production?

  # App routes
  match '/',     to: 'crank_test#home'
  match '*path', to: 'crank_test#home'
end
