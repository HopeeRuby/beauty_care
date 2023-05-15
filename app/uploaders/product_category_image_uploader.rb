# frozen_string_literal: true

class ProductCategoryImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  version :medium do
    process resize_to_fill: [250, 250]
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/medium"
    end
  end

  version :small do
    process resize_to_fill: [50, 50]
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/small"
    end
  end

  def default_url(version_name = :small_or_medium)
    version = version_name == :small_or_medium ? %i[small medium] : version_name
    ActionController::Base.helpers.asset_path(
      "fallback_product_category/#{[version, 'default.png'].flatten.compact.join('_')}"
    )
  end

  def size_range
    1..(2.megabytes)
  end
end