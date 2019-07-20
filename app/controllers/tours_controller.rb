class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :likes, :unlikes]

  def index
    if params[:query].present? || params["search"]
      tours = policy_scope(Tour).order(created_at: :desc)
      @filter = params[:query].present? || params["search"]["activity"].concat(params["search"]["location"]).flatten.reject(&:blank?)
      @tours = tours.search_for_tour(params[:query]) || @filter.empty? ? Tour.all : Tour.all.tagged_with(@filter, any: true)
    else
      @tours = policy_scope(Tour).order(created_at: :desc)
    end
  end

  def show
    set_tour
    @related_tours = @tour.find_related_tags
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
      redirect_to tours_path, notice: "Tour was created successfully"
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

  def likes
    @user = current_or_guest_user # before_action :authenticate_user, only: [:likes]
    set_tour
    @user.like!(@tour)
      respond_to do |format|
      format.html { redirect_to :back, alert: "Unsaved" }
      format.js { render layout: false }
      end
    #redirect_to tour_path, alert: "Unsaved"
  end

  def unlikes
    @user = current_or_guest_user
    set_tour
    @user.unlike!(@tour)
    respond_to do |format|
      format.html { redirect_to :back, alert: "Unsaved" }
      format.js { render layout: false }
      end
    #redirect_to tour_path, alert: "Save for later"
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def tour_params
    params.require(:tour).permit(:name, :content, :itinerary, :price, :code,
                    :duration, :style, :theme, :comfort, :start_end_des,
                    :photo, :photo_1, :photo_2, :photo_3, :location_id, :activity_id, :tag_list)
  end
end
