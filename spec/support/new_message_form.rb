# frozen_string_literal: true

class NewMessageFrom
  include Capybara::DSL

  def visit_contact_page
    visit '/contact'
    self
  end

  def fill_the_form_with(params = {})
    within('#contact-form-1') do
      fill_in 'Name', with: params[:name]
      fill_in 'Email', with: params[:email]
      fill_in 'Message', with: params[:message]
    end
    self
  end

  def submit
    click_on 'Send Message'
  end
end
