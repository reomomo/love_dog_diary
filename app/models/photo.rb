class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  belongs_to :my_dog

  validates :user_id, presence: true
  validates :diary_id, presence: true
  validates :my_dog_id, presence: true
  validates :title, presence: true
  validates :image, presence: true

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
