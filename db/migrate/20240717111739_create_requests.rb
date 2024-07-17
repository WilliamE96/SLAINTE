class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|

      t.timestamps
    end
  end
end
