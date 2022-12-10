Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :junks, only: [:index, :show, :new, :create, :edit, :update, :destroy ]

  resources :services

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :messages, only: :destroy

  get '/tagged', to: "services#tagged", as: :tagged

end
