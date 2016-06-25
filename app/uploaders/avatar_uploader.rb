class AvatarUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  process resize_to_fit: [800, 800]

  storage :aws

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("bike_marker.png")
  end

  version :thumb do
    process :resize_to_fit => [150, 150]
  end
end