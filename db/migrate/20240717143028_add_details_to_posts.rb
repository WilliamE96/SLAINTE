class AddDetailsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_column :posts, :content, :string
    add_column :posts, :image_url, :string
    add_column :posts, :created_at, :datetime, null: false
    add_column :posts, :updated_at, :datetime, null: false
  end
end
