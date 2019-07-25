Rails.application.routes.draw do
  #lazy user registration follow intruction on https://www.bignerdranch.com/blog/lazy-user-registration-for-rails-apps/
   devise_for :users

  root to: 'pages#home'
  get 'tags/:tag', to: 'tours#index', as: :tag
  get 'tours/:id/likes', to: 'tours#likes', as: :likes
  get 'tours/:id/unlikes', to: 'tours#unlikes', as: :unlikes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :countries, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :tailortours, only: [:index, :show, :new, :create, :update, :destroy, :edit]

  resources :activities, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :locations, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  resources :tours, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :bookings, only: [:create, :new]
    resources :pdf, only: [:create, :new]

  end
  resources :bookings, only: [:update, :destroy, :index, :show]

  namespace :providers do
    resources :bookings, only: [:index, :update, :destroy]
    resources :tours, only: [:index, :edit, :destroy]
  end

end
