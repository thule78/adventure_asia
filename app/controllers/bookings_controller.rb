class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

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
    @booking.customer = current_or_guest_user

    if @booking.save
      # mail = BookingMailer.with(booking: @booking).request
      # mail.deliver_now
      redirect_to tours_path, notice: "Your booking was created successfully"
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
                  :note, :name, :email, :hotel)
  end
end
