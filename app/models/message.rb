class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates_format_of :email, with: Devise.email_regexp
end
