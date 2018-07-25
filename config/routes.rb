Rails.application.routes.draw do

  root "main#index"

  devise_for :users, path: 'users', :controllers => { registrations: 'users/registrations' }
  devise_for :patrons, path: 'patrons'

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :create]
  end

  resources :tables, only: [:show]

  get '/users/:user_id/setup', to: 'users#setup', as: 'user_setup'
  post '/users/:user_id/setup', to: 'users#update', as: 'user_update'

  delete '/tables/:user_id/delete', to: 'tables#destroy', as: 'table_delete'
  patch '/tables/:user_id/update', to: 'tables#update', as: 'table_update'

  resources :patrons, only: [:show, :edit, :update, :destroy] do
    resources :favourites, only: [:create, :index]
  end

  delete '/patrons/:patron_id/favourites', to: 'favourites#destroy', as: 'favourite_delete'

end
