Rails.application.routes.draw do
  resources :categories
  resources :doctors
  resources :users

  root 'welcome#index'
end
