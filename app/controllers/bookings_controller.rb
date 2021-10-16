class BookingsController < ApplicationController
   def create
    @booking = Booking.new(booking_params)
    @spot = Spot.find(params[:spot_id])
    @booking.spot = @spot
    @booking.save
    redirect_to spot_path(@spot)
  end

  private

  def booking_params
    params.require(:review).permit(:content)
  end
end
