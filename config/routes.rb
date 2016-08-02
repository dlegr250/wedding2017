Rails.application.routes.draw do

  # Authentication
  #----------------------------------------------------------------------

  scope module: :authentication do
    get :login, to: "sessions#new", as: :login
    post :login, to: "sessions#create", as: :authenticate
    get :logout, to: "sessions#destroy", as: :logout

    resources :password_resets, only: [:new, :create, :show, :update]
    resources :confirmations
  end

  # Standard
  #----------------------------------------------------------------------

  scope module: :authenticated do
    resources :guests
    resources :parties
    resources :users
  end

  # Root
  #----------------------------------------------------------------------

  root to: "authentication/sessions#new"
end
