class Request < ApplicationRecord
  #user who sent friend request
  belongs_to :sender, class_name: "User"
  #user who got the fried request
  belongs_to :receiver, class_name: 'User'
end
