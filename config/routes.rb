Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:index, :new, :create, :edit, :update]
  end
  resources :comments, only: [ :destroy ]
  resources :posts do
    member do
      put "vote" => "posts#vote"
    end
  end
  # get '/home', to: "pages#home"
  get '/categorized', to: "posts#categorized", as: :categorized
  get '/search_post', to: "posts#search_post", as: :search_post
end
