class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer   :user_id
      t.integer   :user_id_source
      t.string    :date_due
      t.date      :date_created
      t.integer   :user_id_created
      t.date      :date_completed
      t.integer   :user_id_completed
      t.integer   :node_id
      t.timestamps
    end
  end
end
