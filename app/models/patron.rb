class Patron < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favourites
  has_many :favourite_users, through: :favourites, source: :user
  # has_many :booked_users, through: :bookings, source: :user
end
