# frozen_string_literal: true

require 'rails_helper'

feature 'home page' do
  scenario 'company logo' do
    visit('/')
    expect(page).to have_content('Pawel')
  end
end
