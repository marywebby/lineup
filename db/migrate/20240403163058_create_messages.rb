class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:messages)
      create_table :messages do |t|
        t.string :role
        t.text :content
        t.timestamps
      end
    end

    # Add enum constraint
    change_column_default :messages, :role, "user"
  end
end
