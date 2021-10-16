class Booking < ApplicationRecord
  belongs_to :sleeper, foreign_key: "user_id", class_name: "User"
  belongs_to :spot
end
