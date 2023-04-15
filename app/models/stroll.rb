class Stroll < ApplicationRecord
  enum vitality_condition: {
    slowly: 0, # のんびり
    a_little_slowly: 1, # ややのんびり
    usually: 2, # 普通
    a_little_vitality: 3, # ちょっと元気
    quite_vitality: 4, # すごく元気
  }

  belongs_to :diary
  has_many :pins, dependent: :destroy
  has_many :dog_strolls, dependent: :destroy
end
