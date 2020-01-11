class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageuploaderUploader
  validates :content, presence: true
end
