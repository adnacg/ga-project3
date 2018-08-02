class Booking < ApplicationRecord
  belongs_to :patron
  belongs_to :user
end
