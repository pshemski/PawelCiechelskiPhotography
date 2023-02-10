require 'rails_helper'

feature 'sessions' do
  let(:admin) { Admin.create(email: 'user@example.com', password: 'caplin') }

  scenario 'new session page' do
    visit '/admin'

    expect(page).to have_content('password')
  end

  scenario 'create session with invalid credentials' do
    visit '/admin'
    within("#new_admin") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'wrongpassword'
    end

    click_on('Log in')

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'create session with valid credentials' do
    visit '/admin'
    within("#new_admin") do
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: 'caplin'
    end

    click_on('Log in')

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'sign out' do
    visit '/admin'
    within("#new_admin") do
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: 'caplin'
    end

    click_on('Log in')
    click_on('Sign Out')
    expect(page).not_to have_content('Categories')
  end
end