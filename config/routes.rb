Rails.application.routes.draw do
  resources :tasks_labels
  resources :labels
  root "sessions#new"
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end