require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resource :following_relationship, only: [:create, :destroy]
  end


  resources :shouts, only: [:create]

  resources :image_subjects, only: [:create]

  get "/sign_up", to: "users#new"

  constraints Monban::Constraints::SignedIn.new do
    get "/search", to: "search#index"
    root to: "dashboards#show", as: :dashboard
    resource :following, only: [:show]
    resource :followers, only: [:show]
    
    get ":user_name", to: "users#show", as: :user


  end

  root to: "sessions#new"
end
