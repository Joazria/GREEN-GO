Rails.application.routes.draw do

  get 'contact/index'
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
  get '/about_us', to: 'pages#about_us'
  get '/contact', to: 'pages#contact'
  # resources :contact, only: [:index, :new, :create]

  resources :bands do
    resources :gigs, only: [:new, :create, :show]
    resources :offers, only: [:new, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :gigs, only: [:destroy, :update, :edit]
  resources :offers, only: [:destroy, :update, :edit]


end
