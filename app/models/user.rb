class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :matches, class_name: 'Match', foreign_key: 'matched_user_id'
  has_many :received_matches, class_name: 'Match', foreign_key: 'user_id'
  has_one_attached :photo
end
