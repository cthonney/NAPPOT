class AddBookingPriceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_price, :float
  end
end
