Rails.application.routes.draw do
  namespace :admin do
      resources :doctors
      resources :users
      resources :categories
      resources :appointments

      root to: "doctors#index"
    end
  devise_for :doctors
  devise_for :users
  resources :categories, only: [:show]
  resources :doctors, only: [:show, :index]
  resources :users, only: [:show]
  resources :appointments, only: [:show]

  root 'welcome#index'
end
