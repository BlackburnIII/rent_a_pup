Rails.application.routes.draw do
  resources :puppies


  devise_for :users
  root to: 'pages#home'

  get "puppies/:id/edit", to: "puppies#edit"

  patch "puppies/:id", to: "puppies#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
