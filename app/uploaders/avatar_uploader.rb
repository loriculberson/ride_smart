class AvatarUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  process resize_to_fit: [800, 800] 
 
  storage :aws
  # storage :file
  # permissions 0777
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [150, 150]
  end

  version :preview do
    process :resize_to_fit => [256, 256]
  end

  version :full do
    process :resize_to_fit => [2048, 2048]
  end

end
