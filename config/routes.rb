# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'administrator', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup', edit: 'admin/edit' }
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "index#index"

  namespace :administrator do
    # route for administrator
    root 'dashboard#index'
    resources :admins do
      get 'profile', on: :collection
      patch 'change_password', on: :member
      get 'edit_password', on: :member 
    end
  end
end
