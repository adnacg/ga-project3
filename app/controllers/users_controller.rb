class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tables = @user.tables
    @two_seaters_free = @tables.where('seater': 2, 'is_free': true)
    @two_seaters_total = @tables.where('seater': 2).count
    @four_seaters_free = @tables.where('seater': 4, 'is_free': true)
    @four_seaters_total = @tables.where('seater': 4).count
    @six_seaters_free = @tables.where('seater': 6, 'is_free': true)
    @six_seaters_total = @tables.where('seater': 6).count
  end
end
