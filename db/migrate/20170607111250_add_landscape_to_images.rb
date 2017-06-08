class AddLandscapeToImages < ActiveRecord::Migration
  def change
    add_column :images, :landscape, :boolean, default: false
  end
end
