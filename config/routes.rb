Rails.application.routes.draw do
  resources :expense_categories
  resources :categories
  resources :expenses
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
