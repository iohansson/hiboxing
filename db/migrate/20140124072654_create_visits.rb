class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :sub_id

      t.timestamps
    end
    add_index :visits, :sub_id
  end
end
