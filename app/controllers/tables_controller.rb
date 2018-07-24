class TablesController < ApplicationController
  def index
    @tables = Table.all
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
