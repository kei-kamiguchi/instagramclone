class Post < ApplicationRecord
  mount_uploader :image, ImageuploaderUploader
  validates :content, presence: true
end
