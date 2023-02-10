class NewSessionFrom
  include Capybara::DSL

  def visit_new_session_page
    visit '/admin'
    self
  end

  def fill_the_form_with(params = {})
    within("#new_admin") do
      fill_in 'Email', with: params[:email]
      fill_in 'Password', with: params[:password]
    end
    self
  end

  def submit
    click_on 'Log in'
  end
end