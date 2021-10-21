class Spot < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many_attached :photos
  has_many :bookings
end
