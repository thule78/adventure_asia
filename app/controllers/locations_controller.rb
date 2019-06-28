class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = policy_scope(Location).order(name: :asc)
  end

  def show
    set_location
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      flash[:success] = "Location was created successfully"
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
    set_location
  end

  def update
    set_location
    if  @location.update(location_params)
        redirect_to location_path
    else
      render :edit
    end
  end

  def destroy
    set_location
    @location.destroy
    redirect_to locations_path
  end

  def set_location
    @location = Location.find(params[:id])
    authorize @location
  end

  private

  def location_params
    params.require(:location).permit(:name, :summary,
                    :sights, :address, :photo, :country_id)
  end
end
