require 'test_helper'

class TailortourMailerTest < ActionMailer::TestCase
  test "thankyou" do
    mail = TailortourMailer.thankyou
    assert_equal "Thankyou", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
