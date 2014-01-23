class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.integer :sportsman_id
      t.integer :group_id
      t.integer :trainings_left
      t.date :until

      t.timestamps
    end
  end
end
