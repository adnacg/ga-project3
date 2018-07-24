class TablesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
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
  end

  private

  def table_params
    params.require(:tables).permit(:seater, :is_free)
  end
end
