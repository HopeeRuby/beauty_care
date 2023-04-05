Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/edit'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :companies
  resources :posts
end
