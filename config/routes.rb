Rails.application.routes.draw do
  get 'tables/index'
  get 'tables/show'
  get 'tables/new'
  get 'tables/create'
  get 'tables/edit'
  get 'tables/update'
  get 'tables/destroy'
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

end
