class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.integer :node_id
      t.string  :criteria
      t.string  :value1
      t.string  :value2
      t.string  :value3
      t.string  :type
      t.timestamps
    end
  end
end
