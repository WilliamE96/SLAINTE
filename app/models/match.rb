class Match < ApplicationRecord
  belongs_to :user
  belongs_to :matched_user, class_name: 'User'
  has_many :messages
  enum :status, [:pending, :accepted, :rejected ], default: :pending
end
