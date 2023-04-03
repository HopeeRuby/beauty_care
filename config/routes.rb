Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :companies
  post 'users/create', to: 'users#create', as: 'create_user'
  post 'companies/create', to: 'companies#create', as: 'create_company'
end
