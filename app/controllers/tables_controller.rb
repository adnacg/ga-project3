class TablesController < ApplicationController
  before_action :authenticate_user!

  def check_user
    if params[:user_id]
      redirect_to('/') if current_user.id != params[:user_id].to_i
    end
  end

  before_action :check_user

  def index
    # route: /users/:user_id/tables
    # method/controller: user_tables GET => tables#index
    @user = User.find(params[:user_id])
    @tables = @user.tables
  end

  def show
    # route: /tables/:id
    # method/controller: table GET => tables#show
    @table = Table.find(params[:id])
    if @table.user_id != current_user.id
      redirect_to ('/')
    end
  end

  def new
    # route: /users/:user_id/tables/new
    # method/controller: new_user_table GET => tables#new
  end

  def create
    # route: /users/:user_id/tables
    # method/controller: user_tables POST => tables#create
    new_table = Table.new(table_params)
    new_table.user = User.find(params[:user_id])
    new_table.is_free = true
    if new_table.save
      redirect_to new_table
    else
      render 'new'
    end
  end

  def edit
    # route: /tables/:id/edit
    # method/controller: edit_table GET => tables#edit
    @table = Table.find(params[:id])
  end

  def update
    # route: /tables/:id
    # method/controller: table PATCH => tables#update
    table = Table.find(params[:id])
    table.update(table_params)
    redirect_to table
  end

  def destroy
    # route: /tables/:id
    # method/controller: table DELETE => tables#destroy
    table = Table.find(params[:id])
    user = table.user
    table.destroy
    redirect_to user_tables_path(user)
  end

  private
  def table_params
    params.require(:table).permit(:seater, :is_free, :user_id)
  end
end