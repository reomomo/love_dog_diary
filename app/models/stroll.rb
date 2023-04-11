class Stroll < ApplicationRecord
  belongs_to :diary
  has_many :pins, dependent: :destroy
end
