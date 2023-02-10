require 'rails_helper'
require_relative '../../support/new_session_form'

feature 'sessions' do
  let(:admin) { Admin.create(email: 'user@example.com', password: 'caplin') }
  let(:new_session_form) { NewSessionFrom.new }

  scenario 'new session page' do
    new_session_form.visit_new_session_page

    expect(page).to have_content('Log in')
  end

  scenario 'create session with invalid credentials' do
    new_session_form.visit_new_session_page.fill_the_form_with(
      email: admin.email,
      password: 'wrongpassword'
    ).submit

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'create session with valid credentials' do
    new_session_form.visit_new_session_page.fill_the_form_with(
      email: admin.email,
      password: 'caplin'
    ).submit

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'sign out' do
    new_session_form.visit_new_session_page.fill_the_form_with(
      email: admin.email,
      password: 'caplin'
    ).submit

    click_on('Sign Out')
    expect(page).not_to have_content('Categories')
  end
end