class Diary < ApplicationRecord
  enum appetite: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }, _prefix: true

  enum excreta: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }, _prefix: true

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :strolls, dependent: :destroy

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-imag.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def diary_show
    @day_params = params[:format]
  end  

end
