Rails.application.routes.draw do
  resources :instruments
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'instruments#index'
  # root 'store#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
