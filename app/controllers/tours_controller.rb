class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :likes, :unlikes]

  def index
    if params["search"] #params[:query].present? ||
      tours = policy_scope(Tour).order(created_at: :desc)
      @filter = params[:query].present? || params["search"]["activity"].concat(params["search"]["location"]).flatten.reject(&:blank?)
      @tours = @filter.empty? ? Tour.all : Tour.all.tagged_with(@filter, any: true)
      #@tours = tours.search_for_tour(params[:query]) #|| @filter.empty? ? Tour.all : Tour.all.tagged_with(@filter, any: true)
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
    @tour.providers = current_user
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
    @user = guest_user # before_action :authenticate_user, only: [:likes]
    set_tour
    @user.like!(@tour)
    #redirect_to tour_path, alert: "Unsaved"
    respond_to do |format|
    format.html { redirect_to tour_path, alert: "Unsaved" }
    format.js
    end
  end

  def unlikes
    @user = guest_user
    set_tour
    @user.unlike!(@tour)
    #redirect_to tour_path, alert: "Save for later"
    respond_to do |format|
    format.html { redirect_to tour_path, alert: "Save for later" }
    format.js
    end
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
