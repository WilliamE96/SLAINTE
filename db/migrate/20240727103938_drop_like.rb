class DropLike < ActiveRecord::Migration[7.1]
  def change
    drop_table :likes
  end
end
