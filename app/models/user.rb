class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :my_dogs, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :strolls, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :user_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

end
