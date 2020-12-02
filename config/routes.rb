Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
  get '/about_us', to: 'pages#about_us'

  resources :bands do
    resources :gigs, only: [:new, :create, :show]
    resources :offers, only: [:new, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :gigs, only: [:destroy, :update, :edit]
  resources :offers, only: [:destroy, :update, :edit]


end
