Rails.application.routes.draw do
  root 'series#index'

  resources :series
  resources :sermons
end
