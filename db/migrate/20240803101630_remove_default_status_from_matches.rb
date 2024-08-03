class RemoveDefaultStatusFromMatches < ActiveRecord::Migration[7.1]
  def change
    change_column_default :matches, :status, from: 'pending', to: nil
  end
end
