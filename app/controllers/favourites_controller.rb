class FavouritesController < ApplicationController
  before_action :authenticate_patron!

  def check_patron
    if params[:patron_id]
      redirect_to('/') if current_patron.id != params[:patron_id].to_i
    end
  end

  before_action :check_patron

  def index
    patron = Patron.find(params[:patron_id])
    @users = patron.users
  end

  def create
    user = User.find(params[:user_id])
    favourite = Favourite.new
    favourite.patron = Patron.find(params[:patron_id])
    favourite.user = user
    favourite.save
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    favourite = Favourite.where(patron_id: params[:patron_id], user_id: user.id)
    if favourite.count == 1
      favourite.first.destroy
    end
    redirect_to user_path(user)
  end
end