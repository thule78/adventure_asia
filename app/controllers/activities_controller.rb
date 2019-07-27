class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @activities = policy_scope(Activity).order(name: :asc)
  end

  def show
    set_activity
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if @activity.save
      flash[:success] = "Activity was created successfully"
      redirect_to activities_path
    else
      render :new
    end
  end

  def edit
    set_activity
  end

  def update
    set_activity
    if  @activity.update(activity_params)
        redirect_to activity_path
    else
      render :edit
    end
  end

  def destroy
    set_activity
    @activity.destroy
    redirect_to activities_path
  end

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :summary, :photo, :icon)
  end
end
