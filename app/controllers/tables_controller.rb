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
    @table = Table.update(table_params)
  end

  def destroy
  end

  private

  def table_params
    
  end
end
