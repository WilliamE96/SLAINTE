class DropRequests < ActiveRecord::Migration[7.1]
  def change
    drop_table :requests
  end
end
