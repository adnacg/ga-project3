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
    @two_seaters_free_total = @tables.where('seater': 2, 'is_free': true).count
    @two_seaters_total = @tables.where('seater': 2).count
    @four_seaters_free_total = @tables.where('seater': 4, 'is_free': true).count
    @four_seaters_total = @tables.where('seater': 4).count
    @six_seaters_free_total = @tables.where('seater': 6, 'is_free': true).count
    @six_seaters_total = @tables.where('seater': 6).count
  end

  def show
    # route: /tables/:id
    # method/controller: table GET => tables#show
    @table = Table.find(params[:id])
    if @table.user_id != current_user.id
      redirect_to ('/')
    end
  end

  def create
    # route: /users/:user_id/tables
    # method/controller: user_tables POST => tables#create
    new_table = Table.new
    user = User.find(params[:user_id])
    new_table.seater = params[:seater].to_i
    new_table.user = user
    new_table.is_free = true
    if new_table.save
      # redirect_to user_tables_path
      @totalCountElementId = "#{params[:seater]}_seater_total_tables"
      @freeCountElementId = "#{params[:seater]}_seater_free_tables"
      @total_tables_count = user.tables.where(seater: params[:seater].to_i).count
      @free_tables_count = user.tables.where(is_free: true, seater: params[:seater].to_i).count
    else
      render 'new'
    end
  end

  def update
    # custom route
    # route: /tables/:user_id/update
    # method/controller: table_update PATCH => tables#update
    user = User.find(params[:user_id])
    free = params[:free] == "true"
    filtered_tables = user.tables.where(is_free: !free, seater: params[:seater].to_i)
    if filtered_tables.count > 0
      filtered_tables.first.update(is_free: free)
    end
    # redirect_to user_tables_path(user)
    @elementId = "#{params[:seater]}_seater_free_tables"
    @free_tables_count = user.tables.where(is_free: true, seater: params[:seater].to_i).count
  end

  def destroy
    # custom route
    # route: /tables/:user_id/delete
    # method/controller: table_delete DELETE => tables#destroy
    free_tables = Table.where('seater': params[:seater].to_i, 'user_id': params[:user_id].to_i, is_free: true)
    if free_tables.count > 0
      @error = false
      free_tables.first.destroy
      user = User.find(params[:user_id].to_i)
      # redirect_to user_tables_path(user)
      @totalCountElementId = "#{params[:seater]}_seater_total_tables"
      @freeCountElementId = "#{params[:seater]}_seater_free_tables"
      @total_tables_count = user.tables.where(seater: params[:seater].to_i).count
      @free_tables_count = user.tables.where(seater: params[:seater].to_i, is_free: true).count
    else
      @error = true
    end
  end

  private
  def table_params
    params.require(:table).permit(:seater, :is_free, :user_id)
  end

end