class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.new_message_notification.subject
  #
  def new_message_notification(message)
    @message = message
    admin = Admin.first
    mail to: admin.email, subject: "New message from the gallery!"
  end
end
