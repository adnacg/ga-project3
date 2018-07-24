class TablesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  private
  def table_params
    params.require(:table).permit(:seater, :is_free, :user_id)
  end
end
