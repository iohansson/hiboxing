class AddNumTrainingsAndDaysToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :num_trainings, :integer
    add_column :groups, :days, :integer
  end
end
