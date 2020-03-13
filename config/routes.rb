Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root 'home#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :artists, only: [:show, :new, :create, :edit, :update] do
    collection do
      get 'notyet' 
    end
  end
  resources :posts, except: [:index] do
    member do
      get 'done_show'
      get 'show_post'
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
end
