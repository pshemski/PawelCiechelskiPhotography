class NewImageFrom
  include Capybara::DSL

  def visit_new_image_page
    visit '/'
    click_on 'Add Image'
    self
  end

  def fill_the_form_with(params = {})
    within("#new_image") do
      attach_file 'Image', params[:image]
      fill_in 'Image title', with: params[:image_title]
      find('#image_category_id').find(:xpath, 'option[2]').select_option
      fill_in 'Image description', with: params[:image_description]
    end
    self
  end

  def set_as_front_page_image
    within("#new_image") { check 'Front page image' }
    self
  end

  def submit
    click_on 'Create Image'
  end
end
