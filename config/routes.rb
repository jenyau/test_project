Rails.application.routes.draw do
  resources :categories
  resources :doctors
  resources :users
  resources :appointments

  root 'welcome#index'
end
