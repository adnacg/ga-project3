class PatronsController < ApplicationController
  before_action :authenticate_patron!

  def check_patron
    if params[:id]
      redirect_to('/') if current_patron.id != params[:id].to_i
    end
  end

  before_action :check_patron

  def show
    @patron = Patron.find(params[:id])
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    patron = Patron.find(params[:id])
    patron.update(patron_params)
    redirect_to patron
  end

  def destroy
    patron = Patron.find(params[:id])
    if patron.destroy
      redirect_to root_path
    else
      redirect_to patron
    end
  end

  private
  def patron_params
    params.require(:patron).permit(:name)
  end
end
