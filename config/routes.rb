Rails.application.routes.draw do

  root "main#index"

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :new, :create]
  end

  resources :tables, only: [:show, :edit, :update, :destroy]

  delete '/tables/:type/delete', to: 'tables#delete', as: 'tables'

end
