class AddIndicesToSubs < ActiveRecord::Migration
  def change
    add_index :subs, :group_id
    add_index :subs, :sportsman_id
  end
end
