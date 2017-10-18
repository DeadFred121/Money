class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.payment_notification.subject
  #

  def payment_notification(item, amount)

    @item = item
    @amount = amount

    mail to: ENV.fetch('MY_EMAIL'), subject: "Thankyou for your payment!"
  end
end
