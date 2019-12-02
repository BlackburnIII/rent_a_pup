class Review < ApplicationRecord
  belongs_to :booking
  validates_presence_of :title, :rating
  validates :rating, inclusion: { in: (1..5) }
end
