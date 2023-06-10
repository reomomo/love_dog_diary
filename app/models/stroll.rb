class Stroll < ApplicationRecord
  enum vitality_condition: {
    slowly: 0, # のんびり
    a_little_slowly: 1, # ややのんびり
    usually: 2, # 普通
    a_little_vitality: 3, # ちょっと元気
    quite_vitality: 4, # すごく元気
  }

  belongs_to :user
  belongs_to :diary
  belongs_to :my_dog
  has_many :pins, dependent: :destroy

  validates :user_id, presence: true
  validates :diary_id, presence: true
  validates :my_dog_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :vitality_condition, presence: true

  def time_of_stroll
    (end_time - start_time).floor / 60
  end

end
