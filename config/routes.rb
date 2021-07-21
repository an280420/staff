Rails.application.routes.draw do
  get 'employment_terms/create'
  get 'divisions/index'
  get 'divisions/show'
  resources :position_histories
  resources :positions
  resources :users do
    resources :employment_terms
  end

  root 'divisions#index'
end
