class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :node_id
      t.timestamps
    end
  end
end
