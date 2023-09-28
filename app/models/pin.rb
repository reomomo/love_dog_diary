class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :stroll

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true


  # test
  # def pins_title
  #   self.title
  # end
  # test

end
