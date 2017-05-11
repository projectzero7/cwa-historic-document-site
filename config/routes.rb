Rails.application.routes.draw do
  get 'users/new'

  resources :documents
  root 'documents#index'
end
