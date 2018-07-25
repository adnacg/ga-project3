Rails.application.routes.draw do

  root "main#index"

  devise_for :users, path: 'users'
  devise_for :patrons, path: 'patrons'

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :new, :create]
  end

  resources :tables, only: [:show, :edit, :update, :destroy]

  delete '/tables/:type/delete', to: 'tables#delete', as: 'tables'

  resources :patrons, only: [:show, :edit, :update, :destroy] do
    resources :favourites, only: [:show, :destroy]
  end

end
