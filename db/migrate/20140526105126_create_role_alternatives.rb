class CreateRoleAlternatives < ActiveRecord::Migration
  def change
    create_table :role_alternatives do |t|
      t.integer :role_id
      t.integer :role_id_alt
      t.timestamps
    end
  end
end
