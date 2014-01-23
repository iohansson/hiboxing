class RemoveEmailFromSportsmen < ActiveRecord::Migration
  def up
    remove_column :sportsmen, :email
  end

  def down
    add_column :sportsmen, :email, :string
  end
end
