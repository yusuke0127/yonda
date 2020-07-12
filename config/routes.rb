Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:index, :new, :create, :edit, :update]
  end
  resources :comments, only: [ :destroy ]
  get '/categorized', to: "posts#categorized", as: :categorized
  get '/searched', to: "posts#searched", as: :searched
end
