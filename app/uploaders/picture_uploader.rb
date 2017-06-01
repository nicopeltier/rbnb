class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    cloudinary_transformation width: 450, height: 200, crop: :thumb
  end

  version :big do
    cloudinary_transformation width: 650, height: 270, crop: :thumb
  end

  version :show do
    cloudinary_transformation width: 650, height: 350, crop: :thumb
  end

  # version :bright_face do
  #   cloudinary_transformation effect: "brightness:30", radius: 20,
  #     width: 150, height: 150, crop: :thumb, gravity: :face
  # end
end
