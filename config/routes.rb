CrankTest::Application.routes.draw do 

  match '/', to: 'crank_test#home'
  
  match '/campaigns_mockup', to: 'crank_test#campaigns_mockup'
  
  match '/campaign_details_mockup', to: 'crank_test#campaign_details_mockup'

  resources :days

  resources :campaigns

  mount JasmineRails::Engine => "/specs" unless Rails.env.production?

end
