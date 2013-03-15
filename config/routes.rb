CrankTest::Application.routes.draw do 

  get "crank_app/home"

  resources :days

  resources :campaigns

  mount JasmineRails::Engine => "/specs" unless Rails.env.production?

end
