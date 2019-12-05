class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :puppy
  validates_presence_of :start_date, :end_date
  has_many :reviews, dependent: :destroy

  # CALL THE VALIDATION METHOD HERE
  validate :no_booking_overlap

  private

  # I GOT THIS CODE FROM TOMMASSO -JBM
  # USING SQL INTERPOLATION HERE W/ THE ACTIVERECORD CLASS.WHERE METHOD -JBM
  def no_booking_overlap
    if (Booking.where("(? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date) AND puppy_id = ?", self.start_date, self.end_date, self.puppy_id).any?)
      errors.add(:end_date, 'Overlaps another reservation.')
    end
  end
end
