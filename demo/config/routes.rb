Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "application#index"
  resources :users
  # get 'users/' => 'users#index'
  # get 'users/:id' => 'users#show'
  # post 'users/' => 'users#create'
  resources :accounts
end
