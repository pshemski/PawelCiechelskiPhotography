class Category < ActiveRecord::Base
	has_many :images, dependent: :destroy
	validates :name, presence: true

	before_save :update_category_name

	private

	def update_category_name
		if name.present? || name.changed?
			self.name = name.capitalize
		end
	end
end
