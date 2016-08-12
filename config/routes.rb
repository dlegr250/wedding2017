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
    resource :dashboard
    resources :mailing_addresses, param: :uuid
    resources :save_the_dates, param: :uuid
    resources :invitations, param: :uuid
    resources :parties, param: :uuid do
      resources :guests, param: :uuid
    end
    resources :users
  end

  # Root
  #----------------------------------------------------------------------

  root to: "authentication/sessions#new"
end
