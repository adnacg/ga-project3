class MainController < ApplicationController
  def index
    @users = User.search(params[:search])
  end

  def modal
    respond_to do |format|
      format.html
      format.js
    end
  end
end
