class AddUserToSportsmen < ActiveRecord::Migration
  def change
    add_column :sportsmen, :user_id, :integer
    add_index :sportsmen, :user_id
  end
end
