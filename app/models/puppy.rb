class Puppy < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :birthdate, :breed
end
