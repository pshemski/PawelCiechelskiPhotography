class AddAdminIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :admin_id, :integer
  end
  add_index :images, :admin_id
end
