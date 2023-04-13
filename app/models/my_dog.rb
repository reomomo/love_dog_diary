class MyDog < ApplicationRecord
    enum size: {
    large_scale_dog: 0, # 大型犬
    medium_size_dog: 1, # 中型犬
    small_size_dog: 2 # 小型犬
  }

  belongs_to :user

  has_one_attached :dog_image

  def get_dog_image(width, height)
    unless dog_image.attached?
      file_path = Rails.root.join('app/assets/images/no-imag.jpg')
      dog_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    dog_image.variant(resize_to_limit: [width, height]).processed
  end
end
