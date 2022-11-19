Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :junks, only: [:index, :show, :new, :create, :edit, :update ]

  resources :services, only: [:index, :show]

end
