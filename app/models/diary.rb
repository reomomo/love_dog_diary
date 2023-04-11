class Diary < ApplicationRecord
  enum appetite: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }

  enum excreta: {
    a_little: 0, # 少ない
    slightly_less: 1, # やや少ない
    usually: 2, # 普通
    good: 3, # やや多い
    excellent: 4, # 多い
  }

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :strolls, dependent: :destroy
end
