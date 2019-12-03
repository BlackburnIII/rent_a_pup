Rails.application.routes.draw do
  resources :puppies do
    resources :bookings, only: [:new, :create]
  end

  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
