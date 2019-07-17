# Preview all emails at http://localhost:3000/rails/mailers/tailortour_mailer
class TailortourMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tailortour_mailer/thankyou
  def thankyou
    TailortourMailer.thankyou
  end

end
