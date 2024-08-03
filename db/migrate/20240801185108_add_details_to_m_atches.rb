class AddDetailsToMAtches < ActiveRecord::Migration[7.1]
  def change
    change_column_default :matches, :status, 'pending'
  end
end
