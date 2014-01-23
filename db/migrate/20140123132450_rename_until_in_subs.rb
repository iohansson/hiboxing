class RenameUntilInSubs < ActiveRecord::Migration
  def change
    rename_column :subs, :until, :until_date
  end
end
