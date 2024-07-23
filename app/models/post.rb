class Post < ApplicationRecord
  belongs_to :users
  has_one_attached :image_url
end
