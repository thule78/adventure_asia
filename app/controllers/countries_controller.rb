class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @countries = policy_scope(Country).order(name: :asc)
  end

  def show
    @country = Country.find(params[:id])
    authorize @country

  end

  def new
    @country = Country.new
    authorize @country
  end

  def create
    @country = Country.new(country_params)
    authorize @country
    if @country.save
      flash[:success] = "Country was created successfully"
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
    authorize @country
  end

  def update
    set_country
    if  @country.update(country_params)
        redirect_to country_path
    else
      render :edit
    end
  end

  def destroy
    set_country
    @country.destroy
    redirect_to countries_path
  end

  def set_country
    @country = Country.find(params[:id])
    authorize @country
  end


  private
  def country_params
    params.require(:country).permit(:name, :summary, :essential_info, :getting_there,
                                    :getting_around, :weather_climate, :visa_permit,
                                    :local_customs, :festival_events, :photo, :icon)

  end

end
