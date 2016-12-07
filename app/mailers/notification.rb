class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_placed.subject
  #
  def order_placed(order)
    @order = order
    mail to: "#{order.user.email}", subject: "Your order placed successfully"
  end

  def order_canceled(order)
  	@order = order
  	mail to:  "#{order.user.email}", subject: "Your order canceled successfully"
  end

end
