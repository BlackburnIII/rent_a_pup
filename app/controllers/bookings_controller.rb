class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(params[:user_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # STILL TO WRITE IF STATEMENT BASED ON
    # START_DATE END_DATE AVAILABILITY
  end

  def delete
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:bookings).permit(:start_date, :end_date)
  end
end
