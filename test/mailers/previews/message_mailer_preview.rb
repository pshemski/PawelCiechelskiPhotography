# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/new_message_notification
  def new_message_notification
    MessageMailer.new_message_notification(Message.new(name: "John", email: "john@example.com", message: "hi!"))
  end

end
