Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root 'home#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :artists, only: [:show, :new, :create, :edit, :update] do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'posts'
      get 'done_posts'
    end
    collection do
      get 'notyet' 
    end
  end
  resources :posts, except: [:index] do
    resources :likes, only: [:index, :create, :destroy]
    member do
      get 'done_show'
      get 'show_post'
      get 'show_house'
      delete 'destroy_post'
      delete 'done_destroy'
    end
    collection do
      get 'live_yet'
      get 'notyet' 
      get 'done'
      get 'not_yet' 
      get 'yet'
    end
  end
  resources :searches, only: [:index] do 
    collection do 
      get 'post_search' 
      get 'artist_search'
    end
  end
end
