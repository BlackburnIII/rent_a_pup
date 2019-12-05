class PuppiesController < ApplicationController
  def index
    @puppies = policy_scope(Puppy.all)
    @markers = []
    @puppies.map do |puppy|
      if !puppy.user.location.nil?
        @markers << {
          lat: puppy.user.latitude,
          lng: puppy.user.longitude
        }
      end
    end
  end

  def show
    @puppy = Puppy.find(params[:id])
    authorize @puppy
    @bookings = Booking.where(puppy: @puppy)

    # LOOP THROUGH @BOOKINGS TO GET APPROPRIATE REVIEWS
    @reviews = []
    @bookings.each do |booking|
      @reviews << Review.where(
        # WHERE THE BOOKING OF THE REVIEW IS THIS BOOKING
        booking: booking,
        # && WHERE THE REVIEWEE FIELD == BOOKING
        reviewee: "puppy"
      )
    end
  end

  def new
    @puppy = Puppy.new
    authorize @puppy
    @user = current_user
  end

  def create
      @puppy = Puppy.new(puppy_params)
      authorize @puppy
      @user = current_user
      @puppy.user = @user
      if @puppy.save
        redirect_to puppy_path(@puppy)
      else
        render :new
      end
  end

  def edit
    @puppy = Puppy.find(params[:id])
    authorize @puppy
  end

  def update
    @puppy = Puppy.find(params[:id])
    @puppy.update(puppy_params)

    redirect_to puppy_path(@puppy)
  end

  def delete

  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :birthdate, :breed)

  end
end
