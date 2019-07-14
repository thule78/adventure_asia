class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    set_booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @tour = Tour.find(params[:tour_id])
  end

  def update
    set_booking
    @booking.update(booking_params)

    redirect_to tour_path(@booking.tour)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @tour = Tour.find(params[:tour_id])
    @booking.tour = @tour

    if @booking.save
      flash[:success] = "Your booking was created successfully"
      redirect_to tours_path
    else
      render :new
    end
  end

  def destroy
    set_booking
    @booking.destroy

    redirect_to bookings_path
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:head_count, :date,
                  :note, :name, :email, :hotel, :confirmed)
  end
end
