Rails.application.routes.draw do
  resources :puppies do
    resources :bookings, only: [:new, :create, :show] do
      resources :reviews, only: [:create]
    end
  end
  resources :bookings, only: :destroy

  devise_for :users

  root to: 'pages#home'
  get '/profile', to: 'pages#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
