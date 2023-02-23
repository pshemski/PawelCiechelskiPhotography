FactoryBot.define do
  factory :message do
    name { 'John Philips' }
    email { 'john@email_provider.com' }
    message { 'Test message' }
  end
end
