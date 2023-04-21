class Pin < ApplicationRecord
  belongs_to :stroll

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true

end
