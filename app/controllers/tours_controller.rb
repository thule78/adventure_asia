class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      tours = policy_scope(Tour).order(created_at: :desc)
      @tours = tours.search_for_tour(params[:query])
    else
      @tours = policy_scope(Tour).order(created_at: :desc)
    end
  end

  def show
    set_tour
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def create
    @tour = Tour.new(tour_params)
    authorize @tour
    @tour.provider = current_user
    if @tour.save
      flash[:success] = "Tour was created successfully"
      redirect_to tours_path
    else
      render :new
    end
  end

  def edit
    set_tour
  end

  def update
    set_tour
    if  @tour.update(tour_params)
        redirect_to tour_path
    else
      render :edit
    end
  end

  def destroy
    set_tour
    @tour.destroy
    redirect_to tours_path
  end

  def set_tour
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :content, :itinerary, :price, :code,
                    :duration, :style, :theme, :comfort, :start_end_des,
                    :photo, :photo_1, :photo_2, :photo_3, :location_id, :activity_id)
  end
end
