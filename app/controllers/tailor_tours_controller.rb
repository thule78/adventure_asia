class TailorToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @tailortours = policy_scope(TailorTour).order(created_at: :desc)
  end

  def show
    set_tailor
  end

  def new
    @tailortour = TailorTour.new
    authorize @tailortour
  end

  def update
    set_tailor
    @tailortour.update(tailortour_params)

    redirect_to tailor_path(@tailortour)
  end

  def create
    @tailortour = TailorTour.new(tailortour_params)
    authorize @tailortour

    if @tailortour.save
      flash[:success] = "Your booking was created successfully"
      mail = TailortourMailer.with(tailor_tour: @tailortour).thankyou
      mail.deliver_now
      redirect_to tours_path
    else
      render :new
    end
  end

  def destroy
    set_tailor
    @tailortour.destroy

    redirect_to tailortours_path
  end

  def set_tailor
    @tailortour = TailorTour.find(params[:id])
    authorize @tailortour
  end

  private

  def tailortour_params
    params.require(:tailor_tour).permit(:head_count, :depature_date,
                  :text, :name, :email, :hotel, :activity,
                  :comfort, :theme, :days, :destination )
  end
end
