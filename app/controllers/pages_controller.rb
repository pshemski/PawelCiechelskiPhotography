class PagesController < ApplicationController
  def home
  	@images = Image.where(front_page_image: true).order('id DESC')
    render layout: 'home_layout'
  end

  def about
    @admin = Admin.first
  end
end
