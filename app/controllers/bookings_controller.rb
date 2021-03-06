class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def bookings
    @bookingsall = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @spot = Spot.find(params[:spot_id])
    @booking.spot = @spot
    @booking.booking_price = @spot.price
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to root_path
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:date, :user_id, :spot_id, :booking_price)
  end
end

