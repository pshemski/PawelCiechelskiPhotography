class Image < ActiveRecord::Base
  belongs_to :category
  mount_uploader :image, ImageUploader

  before_save :update_image_attributes
  validates_presence_of :image, :image_title, :image_description, :category_id

  private

  def update_image_attributes
    return unless new_record? || image_changed?

    self.image_file_size = image.file.size
    self.image_content_type = image.file.content_type
    self.landscape = true if image.is_landscape?(image)
  end
end
