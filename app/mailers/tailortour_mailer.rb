class TailortourMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tailortour_mailer.thankyou.subject
  #
  def thankyou
    @tailortour = params[:tailor_tour] # Instance variable => available in view
    mail(to: @tailortour.email, subject: 'Adventure Asia, Tailor Adventure')
  end
end
