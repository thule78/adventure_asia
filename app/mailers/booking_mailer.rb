class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.welcome.subject
  #
  def request
    @booking = params[:booking]

    mail(
      to:       @booking.email,
      subject:  "Adventure Asia, tour request!"
    )
  end
end
