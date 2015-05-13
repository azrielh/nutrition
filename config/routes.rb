Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'welcome#index'

  resources :recipes do
    resources :ingredients
    resources :directions
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    # we do this because we don't need an id to log
    # the user out. The user id is in the session and it
    # should be included in the URL
    delete :destroy, on: :collection
  end

  # get :login, to: 'session#show'
  # get :logout, to: 'session#destroy'

end
