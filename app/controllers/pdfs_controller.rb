class PdfsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @pdfs = policy_scope(Pdf).order(created_at: :desc)
  end

  def show
    set_pdf
  end

  def new
    @pdf = Pdf.new
    authorize @pdf
    @pdf = Pdf.find(params[:tour_id])
  end

  def update
    set_pdf
    @pdf.update(pdf_params)

    redirect_to tour_path(@pdf.tour)
  end

  def create
    @pdf = Pdf.new(pdf_params)
    authorize @pdf
    @pdf = Pdf.find(params[:tour_id])
    @pdf.tour = @tour

    if @pdf.save
      # mail = BookingMailer.with(booking: @booking).request
      # mail.deliver_now
      redirect_to tour_path, notice: "Fact sheet was sending to your email"
    else
      render :new
    end
  end

  def destroy
    set_pdf
    @pdf.destroy

    redirect_to pdfs_path
  end
  private

  def set_pdf
    @pdf = Pdf.find(params[:id])
    authorize @pdf
  end

  def pdf_params
    params.require(:pdf).permit(:name, :email,
                  :tour_name, :tour_code)
  end
end

