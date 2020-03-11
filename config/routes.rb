Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root 'home#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :artists, only: [:new, :create, :edit, :update] do
    collection do
      get 'notyet' 
    end
  end
  resources :posts, only: [:show, :new, :create ,:edit, :update] do
    member do
      get 'done_show'
    end
    collection do
      get 'live_yet'
      get 'notyet' 
      get 'done'
      get 'not_yet' 
      get 'yet'
    end
  end
end
