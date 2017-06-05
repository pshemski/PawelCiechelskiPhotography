class AddFrontPageImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :front_page_image, :boolean
  end
end
