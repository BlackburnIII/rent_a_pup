class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name, :email, :encrypted_password
  validates_uniqueness_of :email
  has_many :puppies, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
