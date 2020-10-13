Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users

  namespace :admin do
      resources :doctors
      resources :users
      resources :categories
      resources :appointments

      root to: "doctors#index"
    end

  resources :categories, only: [:show, :index]
  resources :doctors, only: [:show, :index]
  resources :users, only: [:show]
  resources :appointments, only: [:show, :edit, :new, :create, :update]

  root 'welcome#index'
end
