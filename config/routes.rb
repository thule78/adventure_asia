Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :countries, only: [:index, :show, :new, :create, :update, :destroy, :edit]

  resources :activities, only: [:index, :show, :new, :create, :update, :destroy]
  resources :locations, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :tours, only: [:index, :show, :new, :create, :update, :destroy, :edit]

  namespace :providers do
    resources :bookings, only: [:index, :update, :destroy]
    resources :tours, only: [:index, :edit, :destroy]
  end

end
