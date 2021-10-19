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
    @spot = Spot.find(params[:spot_id])
    @booking.spot = @spot
    @booking.save
    redirect_to spot_path(@spot)
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :user_id, :spot_id, :price)
  end
end

