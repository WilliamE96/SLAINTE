class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts, class_name: 'Match', foreign_key: 'matched_user_id'
  has_many :matches, class_name: 'Match', foreign_key: 'matched_user_id'
  has_many :received_matches, class_name: 'Match', foreign_key: 'user_id'
  has_one_attached :profile_picture
  # hasy_many :asked_matches, class_name: 'Match', foreign_key: 'user_id'
  # #sent by user
  # has_many :sent_requests, class_name: "Request", foreign_key: 'sender_id'
  # #sent from user
  # has_many :received_requests, class_name: "Request", foreign_key: 'receiver_id'
end
