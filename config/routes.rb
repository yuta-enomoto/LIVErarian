Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # confirmations: 'users/confirmations'
  }

  root 'home#index'
end
