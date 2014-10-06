class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|
      t.integer :node_id
      t.integer :role_id
      t.string  :field_type
      t.string  :name
      t.string  :location
      t.integer :rank
      t.boolean :multi
      t.boolean :must_fill
      t.string :update_db
      t.string :select_db
      t.timestamps
    end
  end
end
