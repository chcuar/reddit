Rails.application.routes.draw do
  # resources - generate all routes for the controller resources :controller
  # custom route - get 'where it is going' - get 'controller#action'
  # root 'controller#action' the main/ root page, localhost:3000
  root 'subs#index'
  
  resources :subs do
    resources :topics
  end

  # resources :comments
  
end
