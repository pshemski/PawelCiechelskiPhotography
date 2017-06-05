class AddProfileImageToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :profile_picture, :string
    add_column :admins, :about, :text
  end
end
