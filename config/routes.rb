# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "index#index"

  namespace :administrator do
    # route for administrator
    root 'dashboard#index'
  end
  # route for frontend
  resources :users
end
