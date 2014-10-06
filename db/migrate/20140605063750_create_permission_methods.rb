class CreatePermissionMethods < ActiveRecord::Migration
  def change
    create_table :permission_methods do |t|
      t.string :name
      t.references :permission_class
      t.timestamps
    end
  end
end
