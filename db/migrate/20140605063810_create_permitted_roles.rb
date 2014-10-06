class CreatePermittedRoles < ActiveRecord::Migration
  def change
    create_table :permitted_roles do |t|
      t.references :role
      t.references :permission_method
      t.timestamps
    end
  end
end
