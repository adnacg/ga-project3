Rails.application.routes.draw do

  root "main#index"

  devise_for :users, path: 'users'
  devise_for :patrons, path: 'patrons'

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :create]
  end

  resources :tables, only: [:show]

  delete '/tables/:user_id/delete', to: 'tables#destroy', as: 'table_delete'
  patch '/tables/:user_id/update', to: 'tables#update', as: 'table_update'

  resources :patrons, only: [:show, :edit, :update, :destroy] do
    resources :favourites, only: [:create, :index, :destroy]
  end

end
