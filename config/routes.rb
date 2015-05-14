Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'welcome#index'

  resources :recipes do
    resources :ingredients
    resources :directions
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
end
