Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts do
    resources :comments, only: [:index, :new, :create, :edit, :update]
  end
end
