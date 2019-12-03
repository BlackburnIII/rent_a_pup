class Puppy < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :birthdate, :breed
  has_many :bookings, dependent: :destroy
end
