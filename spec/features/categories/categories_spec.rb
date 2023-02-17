# frozen_string_literal: true

require 'rails_helper'

feature 'categories' do
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  context 'when creating a new category' do
    scenario 'with invalid attributes' do
      visit '/'
      click_on 'Categories'
      click_on 'Add Category'
      click_on 'Create Category'

      expect(page).to have_content("Name can't be blank")
    end

    scenario 'with valid attributes' do
      visit '/'
      click_on 'Categories'
      click_on 'Add Category'
      fill_in 'Name', with: 'Test'
      click_on 'Create Category'

      expect(page).to have_content('New Category Created')
    end
  end
end
