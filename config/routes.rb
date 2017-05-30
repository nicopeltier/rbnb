Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flat, only: [:create, :new, :index, :show, :edit, :update] do
    resources :bookings, only: [:create, :new, :index]
    resources :reviews, only: [:create, :new, :index]
  end

  resources :users, only: :show
  resources :bookings, only: [:index]

end


