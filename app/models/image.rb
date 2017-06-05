class Image < ActiveRecord::Base
	belongs_to :category
	belongs_to :admin
	mount_uploader :image, ImageUploader

	before_save :update_image_attributes
	validates_presence_of :image, :image_title, :image_description, :category_id

	private

	def update_image_attributes
		if image.present? || image.changed?
			self.image_file_size = image.file.size
			self.image_content_type = image.file.content_type
		end
	end
end
