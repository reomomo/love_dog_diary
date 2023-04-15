class Diary < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :strolls, dependent: :destroy
  has_many :my_dogs, through: :dog_diaries, dependent: :destroy
  # accepts_nested_attributes_for :dog_diaries, allow_destroy: true

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-imag.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
