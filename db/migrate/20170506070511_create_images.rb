class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :image_title
      t.string :image_description
      t.string :image_file_size
      t.string :image_content_type
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :images, :category_id
  end
end
