class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :group_id
      t.integer :day
      t.time :start
      t.time :stop

      t.timestamps
    end
  end
end
