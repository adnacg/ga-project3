Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :tables, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

end
