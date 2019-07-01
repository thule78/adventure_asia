class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    set_booking
  end

  def new
    @booking = Booking.new
    authorize @booking
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
    @booking.tour_id = @tour.id
    @booking.user_id = current_user

    if @booking.save
      flash[:success] = "Your booking was created successfully"
      redirect_to tours_path
    else
      render template: 'tours/show', alert: 'Invalid information.'
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
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:booking).permit(:headcount, :date, :tour_id,
                                    :comfirmed, :note, :user_id, :name, :email, :hotel)
  end
end
