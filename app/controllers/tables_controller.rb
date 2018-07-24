class TablesController < ApplicationController
 
  before_action :authenticate_user!

  def index
    @current_user = User.find_by_id(2)
    @tables = @current_user.tables
  end

  def show
    @tables = Table.find(params[:id])
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
