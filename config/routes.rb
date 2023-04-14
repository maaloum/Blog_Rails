Rails.application.routes.draw do
  namespace :api do
    get 'v1/posts'
  end
  devise_for :users

    # resources :users
    # resources :posts
    # resources :comments
    root "users#index"
    resources :users, only: [:index, :show] do 
        resources :posts, only: [:index, :show, :new, :create] do 
            resources :comments, only: [:new, :create]
            resources :likes, only: [:create]
        end
    end

end
