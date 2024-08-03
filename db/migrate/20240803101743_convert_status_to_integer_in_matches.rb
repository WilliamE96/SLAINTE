class ConvertStatusToIntegerInMatches < ActiveRecord::Migration[7.1]
  def up
    change_column :matches, :status, :integer, using: 'status::integer'
  end

  def down
    change_column :matches, :status, :string
  end
end
