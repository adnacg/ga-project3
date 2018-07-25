class FavouritesController < ApplicationController
  def index
    # patrons/:patron_id/favourites
    patron = Patron.find(params[:patron_id])
    @favourites = patron.favourites
  end

  def create
    @new_favs = Favourite.create(:patron_id => params[:patron_id].to_i)
  end

  def destroy
    @unliked_res = Favourite.find(params[:id].to_i)
    @unliked_res.destroy
    redirect_to patron_favourites_path
  end


end
