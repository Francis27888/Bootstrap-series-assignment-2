class User < ApplicationRecord
  mount_uploader :user_image, UserImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :Blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog

  before_save { email.downcase! }
end
