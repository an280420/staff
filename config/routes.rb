Rails.application.routes.draw do
  get 'employment_terms/create'
  get 'divisions/index'
  get 'divisions/show'
  resources :position_histories
  resources :positions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
