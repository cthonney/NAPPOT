class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @booking = Booking.new(spot_id: @spot)

    @bookings = @spot.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        date: booking.date,

      }
    end
  end



  def new
    @spot = Spot.new # needed to instantiate the form_for
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id=current_user.id
    @spot.save

    # no need for app/views/restaurants/create.html.erb

    redirect_to spot_path(@spot)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to spot_path(@spot)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to spots_path
  end



  private

  def spot_params
    params.require(:spot).permit(:address, :title, :description, :capacity, :price, photos: [])
  end






end

