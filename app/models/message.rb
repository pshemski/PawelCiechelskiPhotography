class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates_format_of :email, with: Devise.email_regexp

  after_save :send_email_to_admin

  private

  def send_email_to_admin
    MessageMailer.new_message_notification(self).deliver_later
  end
end
