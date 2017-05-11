Rails.application.routes.draw do
  root 'documents#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :documents
  resources :users
end
