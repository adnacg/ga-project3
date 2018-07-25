class Favourite < ApplicationRecord
  belongs_to :patron
  belongs_to :user
end
