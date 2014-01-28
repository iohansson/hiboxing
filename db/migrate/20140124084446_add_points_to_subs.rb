class AddPointsToSubs < ActiveRecord::Migration
  def change
    add_column :subs, :points, :integer
  end
end
