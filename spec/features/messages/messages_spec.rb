# frozen_string_literal: true

require 'rails_helper'
require_relative '../../support/new_message_form'

feature 'image' do
  let!(:admin) { Admin.create(email: 'user@example.com', password: 'caplin') }
  let(:new_message_form) { NewMessageFrom.new }

  context 'when creating a new image' do
    scenario 'with invalid attributes' do
      new_message_form.visit_contact_page.fill_the_form_with(
        name: nil,
        email: 'test@example.com',
        message: 'Test message'
      ).submit

      expect(page).to have_content('An error occurred while delivering this message.')
    end

    scenario 'with valid attributes' do
      new_message_form.visit_contact_page.fill_the_form_with(
        name: 'Test Name',
        email: 'test@example.com',
        message: 'Test message'
      ).submit

      expect(page).to have_content('Thank you for your message. We will get back to you soon.')
    end
  end
end
