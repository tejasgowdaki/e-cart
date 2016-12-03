require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "order_placed" do
    mail = Notification.order_placed
    assert_equal "Order placed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
