class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :flow_id
      t.string  :name
      t.integer :node_id_parent
      t.integer :duration
      t.integer :node_id_task_starter
      t.boolean :parent_value
      t.string  :node_type
      t.integer :role_id
      t.string  :sql
      t.timestamps
    end
  end
end
