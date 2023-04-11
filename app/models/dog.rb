class Dog < ApplicationRecord
  enum dog_type: {
    large_scale_dog: 0, # 大型犬
    medium_size_dog: 1, # 中型犬
    small_size_dog: 2 # 小型犬
  }

  belongs_to :user
end
