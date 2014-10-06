class CreatePermissionClasses < ActiveRecord::Migration
  def change
    create_table :permission_classes do |t|
      t.string :name
      t.timestamps
    end
  end
end
