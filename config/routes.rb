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

  # RSVP
  #----------------------------------------------------------------------

  resources :rsvp, only: [:index, :create, :show, :update], param: :rsvp_code do
    get :thanks, on: :member
  end

  # Standard
  #----------------------------------------------------------------------

  scope module: :authenticated do
    resource :dashboard

    resources :parties, param: :uuid do
      resources :guests, param: :uuid
    end

    resources :missing_mailing_addresses, only: [:index, :update], param: :uuid
    resources :save_the_dates, only: [:index, :update], param: :uuid
    resources :invitations, only: [:index, :update], param: :uuid

    resources :users
  end

  # Root
  #----------------------------------------------------------------------

  root to: "authentication/sessions#new"
end
