# frozen_string_literal: true

require 'rails_helper'
require_relative '../../support/new_image_form'

feature 'image' do
  let(:admin) { Admin.create(email: 'user@example.com', password: 'caplin') }
  let!(:test_category) { Category.create(name: 'Test') }
  let(:new_image_form) { NewImageFrom.new }

  before do
    login_as admin
  end

  context 'when creating a new image' do
    scenario 'with invalid attributes' do
      new_image_form.visit_new_image_page.fill_the_form_with(
        image: nil,
        image_title: 'Test title',
        image_description: 'Test description',
        category: test_category.name
      ).submit

      expect(page).to have_content("Image can't be blank")
    end

    scenario 'with valid attributes' do
      new_image_form.visit_new_image_page.fill_the_form_with(
        image: "#{Rails.root}/spec/fixtures/images/IMG_2560.jpg",
        image_title: 'Test title',
        image_description: 'Test description',
        category: test_category.name
      ).submit

      expect(page).to have_content('New Image Uploaded')
    end
  end
end
