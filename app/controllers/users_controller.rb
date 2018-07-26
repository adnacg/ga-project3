class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def check_user
    if params[:user_id]
      redirect_to('/') if current_user.id != params[:user_id].to_i
    end
  end

  before_action :check_user

  def index
    @users = User.all
    @users_info = Hash.new
    @users.each do |user|
      total_tables = Table.where(user_id: user.id)
      free_tables = total_tables.where(is_free: true)
      @users_info[user.id] = {
        name: user.name,
        total_tables_count: total_tables.count,
        free_tables_count: free_tables.count
      }
    end
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

    if current_patron
      @is_favourite = @user.favourite_patrons.include?(current_patron)
    end
  end

  def setup
    @user = User.find(params[:user_id].to_i)
  end

  def update
    user = User.find(params[:user_id].to_i)
    user.name = params[:user][:name]
    for i in 0...params[:user][:two_seater].to_i
      new_table = Table.new
      new_table.seater = 2
      new_table.is_free = true
      user.tables << new_table
      if !new_table.save
        redirect_to user_update_path(user)
      end
    end
    for i in 0...params[:user][:four_seater].to_i
      new_table = Table.new
      new_table.seater = 4
      new_table.is_free = true
      user.tables << new_table
      if !new_table.save
        redirect_to user_update_path(user)
      end
    end
    for i in 0...params[:user][:six_seater].to_i
      new_table = Table.new
      new_table.seater = 6
      new_table.is_free = true
      user.tables << new_table
      if !new_table.save
        redirect_to user_update_path(user)
      end
    end
    user.save
    redirect_to user_tables_path(user)
  end
end
