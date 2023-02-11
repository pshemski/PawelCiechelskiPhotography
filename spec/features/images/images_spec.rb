require 'rails_helper'
require_relative '../../support/new_image_form'

feature 'image' do
  let(:admin) { Admin.create(email: 'user@example.com', password: 'caplin') }
  let!(:test_category) { Category.create(name: 'Test') }
  let(:new_image_form) { NewImageFrom.new }
  before { login_as(admin) }

  context 'when creating a new image' do
    scenario 'with invalid attributes' do
      new_image_form.visit_new_image_page.fill_the_form_with(
        image_title: 'Test title',
        category: test_category.name
      ).submit

      expect(page).to have_content("Image can't be blank")
    end
  end
end