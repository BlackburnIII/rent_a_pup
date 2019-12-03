Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :delete] do
    resources :bookings, only: [:index, :show, :edit, :update, :delete]
    resources :reviews
  end
  resources :puppies do
    resources :bookings, only: [:new, :create]
    resources :reviews
  end


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
