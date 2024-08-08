class RemoveChatroomIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :chatroom, index: true, foreign_key: true
  end
end
