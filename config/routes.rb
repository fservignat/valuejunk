Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :junks, only: [:index, :show, :new, :create]

  resources :services, only: [:index, :show]

end
