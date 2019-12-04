class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(params[:user_id])
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
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
    authorize @booking
    # @date = Date.today.to_s
  end

  def create
    @booking = Booking.new(booking_params, user: current_user)
    if @booking.save
      retirect_to puppy_booking_path
    else
      render :new
    end
    # STILL TO WRITE IF STATEMENT BASED ON
    # START_DATE END_DATE AVAILABILITY
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to puppies_path
  end

  private

  def booking_params
    params.require(:bookings).permit(:start_date, :end_date)
  end
end
