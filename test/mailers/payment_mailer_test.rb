require 'test_helper'

class PaymentMailerTest < ActionMailer::TestCase
  test "payment_notification" do
    mail = PaymentMailer.payment_notification
    assert_equal "Payment notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
