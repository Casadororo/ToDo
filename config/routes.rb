Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :bubbles
  root 'home#index'

  patch '/bubbles/:id/update_position', to: 'bubbles#update_position', as: 'update_position'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
