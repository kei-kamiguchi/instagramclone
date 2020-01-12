class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  belongs_to :user
  mount_uploader :image, ImageuploaderUploader
  validates :content, presence: true
end
