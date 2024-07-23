class RemoveImageUrlFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :image_url, :string
  end
end
