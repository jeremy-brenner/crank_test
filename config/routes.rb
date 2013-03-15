CrankTest::Application.routes.draw do 

  match '/', to: 'crank_app#home'

  resources :days

  resources :campaigns

  mount JasmineRails::Engine => "/specs" unless Rails.env.production?

end
