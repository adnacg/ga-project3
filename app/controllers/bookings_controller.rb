class BookingsController < ApplicationController
    before_action :authenticate_patron!

    def check_patron
      if params[:patron_id]
        redirect_to('/') if current_patron.id != params[:patron_id].to_i
      end
    end

    before_action :check_patron

    def index
      patron = Patron.find(params[:patron_id])
      @users = patron.booked_users
    end

    def create
      user = User.find(params[:user_id])
      booking = Booking.new
      booking.patron = Patron.find(params[:patron_id])
      booking.user = user
      booking.save
      redirect_to user_path(user)
    end

    # change logic to render bookings in index instead of users, then delete by booking id
    def destroy
        patron = Patron.find(params[:patron_id])
      booking = Booking.where(patron_id: patron.id, user_id: params[:user_id])
      if booking.count >= 1
        booking.first.destroy
      end
      redirect_to patron_bookings_url(patron)
    end
end
