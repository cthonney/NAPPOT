class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booking_price = @booking.spot.price
    @booking.spot = @spot
    @booking.user_id = current_user
    @booking.spot_id = @spot.id
    @booking.save
    redirect_to spot_path(@spot
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
    params.require(:booking).permit(:start_time, :end_time, :user_id, :spot_id, :booking_price)
  end
end

