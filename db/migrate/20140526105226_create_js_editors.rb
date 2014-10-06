class CreateJsEditors < ActiveRecord::Migration
  def change
    create_table :js_editors do |t|
      t.integer :data_entry_id
      t.string  :js_event
      t.string  :js_code
      t.timestamps
    end
  end
end
