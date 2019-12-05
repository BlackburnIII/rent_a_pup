class Puppy < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :birthdate, :breed
  has_many :bookings, dependent: :destroy

  # MOUNT PHOTO UPLOADER HERE IN PUPPY MODEL -JBM
  mount_uploader :photo, PhotoUploader
end
