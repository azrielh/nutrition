Rails.application.routes.draw do

  root 'welcome#index'

  resources :recipes

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
