class AddDetailsToMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :matches, :user, null: false, foreign_key: true

    add_column :matches, :status, :string
    add_column :matches, :matched_user_id, :integer, null: false
    add_foreign_key :matches, :users, column: :matched_user_id
    add_index :matches, :matched_user_id
  end
end
