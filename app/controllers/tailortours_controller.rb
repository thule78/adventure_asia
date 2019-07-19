class TailortoursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @tailortours = policy_scope(Tailortour).order(created_at: :desc)
  end

  def show
    set_tailor
  end

  def new
    @tailortour = Tailortour.new
    authorize @tailortour
  end

  def update
    set_tailor
    @tailortour.update(tailortour_params)

    redirect_to tailortour_path(@tailortour)
  end

  def create
    @tailortour = Tailortour.new(tailortour_params)
    authorize @tailortour

    if @tailortour.save
      mail = TailortourMailer.with(tailortour: @tailortour).thankyou
      mail.deliver_now
      redirect_to tours_path, notice: "Your inquire was created successfully"
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
    @tailortour = Tailortour.find(params[:id])
    authorize @tailortour
  end

  private

  def tailortour_params
    params.require(:tailortour).permit(:head_count, :depature_date,
                  :text, :name, :email, :hotel, :activity,
                  :comfort, :theme, :days, :destination )
  end
end
