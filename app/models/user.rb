class User < ApplicationRecord
  mount_uploader :image, ImageuploaderUploader
  has_many :posts
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
