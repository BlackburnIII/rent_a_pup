class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :puppy
  validates_presence_of :start_date, :end_date
end
