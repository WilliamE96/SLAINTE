class AddMatchIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :match, foreign_key: true
  end
end
