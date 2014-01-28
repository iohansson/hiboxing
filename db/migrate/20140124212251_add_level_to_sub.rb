class AddLevelToSub < ActiveRecord::Migration
  def change
    add_column :subs, :level, :integer
  end
end
