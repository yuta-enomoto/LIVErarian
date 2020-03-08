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
end
