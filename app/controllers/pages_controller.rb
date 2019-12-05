class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @puppies = current_user.puppies
  end

  def owner
    @puppy = Puppy.find(params[:puppy_id])
    @user = @puppy.user
    @bookings = Booking.where(user: @user)
    @reviews = []
    @bookings.each do |booking|
      @reviews << Review.where(
        # WHERE THE BOOKING OF THE REVIEW IS THIS BOOKING
        booking: booking,
        # && WHERE THE REVIEWEE FIELD == BOOKING
        reviewee: "user"
      )
    end
  end
end
