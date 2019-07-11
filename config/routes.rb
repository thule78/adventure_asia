Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/tagged', to: "tours#tagged", as: :tagged
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :countries, only: [:index, :show, :new, :create, :update, :destroy, :edit]

  resources :activities, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :locations, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :tours, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:update, :destroy, :index]

  namespace :providers do
    resources :bookings, only: [:index, :update, :destroy]
    resources :tours, only: [:index, :edit, :destroy]
  end

end
