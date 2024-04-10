class AddRoutineIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :routine_id, :integer
  end
end
