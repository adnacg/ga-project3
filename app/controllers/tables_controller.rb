class TablesController < ApplicationController
<<<<<<< HEAD
 
=======
>>>>>>> master
  before_action :authenticate_user!

  def index
    @current_user = User.find_by_id(current_user.id)
    @tables = @current_user.tables
  end

  def show
    @current_user = User.find_by_id(current_user.id)
    @tables = @current_user.tables
    @showTable = @tables.find(params[:id])
  end

  def new
    # /users/:user_id/tables/new
    # new_user_table GET => tables#new
  end

  def create
    # /users/:user_id/tables
    # user_tables POST => tables#create
    new_table = Table.new(table_params)
    new_table.user = current_user
    new_table.is_free = true
    if new_table.save
      redirect_to new_user_table
    else
      render 'new'
    end
  end

  def edit
    @table = Table.find_by(:user_id => params[:user_id], :id=> params[:id])
  end

  def update
    @table = Table.find_by(:user_id => params[:user_id], :id=> params[:id])
    @table.update(table_params)
    redirect_to user_table_path(@table)
  end

  def destroy
    @table = Table.find_by(:user_id => params[:user_id], :id => params[:id])
    @table.destroy
    redirect_to user_tables
  end

  private
  def table_params
    params.require(:table).permit(:seater, :is_free, :user_id)
  end
end
