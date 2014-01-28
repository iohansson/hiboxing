class AddDayToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :day, :date
  end
end
