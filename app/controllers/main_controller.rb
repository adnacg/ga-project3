class MainController < ApplicationController
  def index
  end

  def modal
    respond_to do |format|
      format.html
      format.js
    end
  end
end
