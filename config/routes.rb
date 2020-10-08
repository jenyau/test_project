Rails.application.routes.draw do
  resources :categories
  resources :doctors

  root 'welcome#index'
end
