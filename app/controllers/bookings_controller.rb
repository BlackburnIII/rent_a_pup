class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(params[:user_id])
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @review = Review.new
  end

  def new
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new
    authorize @booking
    # @date = Date.today.to_s
  end

  def create
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.puppy = @puppy
    if @booking.save
      redirect_to puppy_booking_path(@puppy, @booking)
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
