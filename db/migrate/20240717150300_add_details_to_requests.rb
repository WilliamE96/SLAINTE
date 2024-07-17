class AddDetailsToRequests < ActiveRecord::Migration[7.1]
  def change

    add_column :requests, :status, :string, default: 'pending'
    add_column :requests, :sender_id, :integer, null: false
    add_column :requests, :receiver_id, :integer, null: false

    add_foreign_key :requests, :users, column: :sender_id
    add_foreign_key :requests, :users, column: :receiver_id
    add_index :requests, :sender_id
    add_index :requests, :receiver_id
  end
end
