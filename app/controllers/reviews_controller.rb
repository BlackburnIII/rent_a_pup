class ReviewsController < ApplicationController
  def create
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.find(params[:booking_id])
    if current_user.id == @booking.user_id
      @reviewee = "user"
    else
      @reviewee = "puppy"
    end
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    @review.reviewee = @reviewee
    authorize @review
    if @review.save
      if @reviewee == "puppy"
        redirect_to puppy_path(@puppy)
      else
        redirect_to owner_path(@puppy)
      end
    else
      render "bookings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
