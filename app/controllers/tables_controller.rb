class TablesController < ApplicationController
 
  before_action :authenticate_user!

  def index
    @current_user = User.find_by_id(4)
    @tables = @current_user.tables
  end

  def show
    @current_user = User.find_by_id(4)
    @tables = @current_user.tables
    @showTable = @tables.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
