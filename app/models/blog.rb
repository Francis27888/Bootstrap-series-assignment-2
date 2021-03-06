class Blog < ApplicationRecord
    mount_uploader :image, ImageUploader
    # validates :name,presence:true
    # validates :email,presence:true
    validates :content,presence:true,length:{maximum:140}
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    # , optional: true
    
end
