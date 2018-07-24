Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :new, :create]
  end

  resources :tables, only: [:show, :edit, :update, :destroy]

end
