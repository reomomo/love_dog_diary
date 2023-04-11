class Diary < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :strolls, dependent: :destroy
end
