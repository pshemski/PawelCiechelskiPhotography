class ImageUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  process :resize_to_fill => [2400, 1600], if: :is_landscape?

  process :resize_to_fill => [1600, 2400], if: :is_portrait?

  version :thumb do
      process :resize_to_fill => [600,400], if: :is_landscape?
      process :resize_to_fill => [400,600], if: :is_portrait?
  end

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  def is_landscape?(new_file)
      image = ::MiniMagick::Image::read(File.binread(@file.file))
      Rails.logger.info "from in is_landscape? : #{image[:width] > image[:height]}"
      image[:width] >= image[:height]
  end

  def is_portrait?(new_file)
    Rails.logger.info "from in is_portrait? : #{ !is_landscape?(new_file)}"
    !is_landscape?(new_file)
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
