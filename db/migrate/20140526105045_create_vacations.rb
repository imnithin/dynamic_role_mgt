class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.integer :user_id
      t.string  :description
      t.date    :start_date
      t.timestamps
    end
  end
end
