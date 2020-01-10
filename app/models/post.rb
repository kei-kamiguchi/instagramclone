class Post < ApplicationRecord
  validates :content, presence: true
  validates :imagem, presence: true
end
