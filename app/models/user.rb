class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :sent_matches, class_name: 'Match', foreign_key: 'user_id'
  has_many :received_matches, class_name: 'Match', foreign_key: 'matched_user_id'
  has_one_attached :photo
end
