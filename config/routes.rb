Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users
  resources :categories
  resources :doctors
  resources :users
  resources :appointments

  root 'welcome#index'
end
