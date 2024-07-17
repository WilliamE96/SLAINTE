class AddDetailsToMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :matches, :user, null: false, foreign_key: true
    add_column :matches, :created_at, :datetime, null: false
    add_column :matches, :updated_at, :datetime, null: false
    add_column :matches, :status, :string
    add_column :matches, :matched_user_id, :integer, null: false

  end
end
