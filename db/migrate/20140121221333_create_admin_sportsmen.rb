class CreateAdminSportsmen < ActiveRecord::Migration
  def self.up
    create_table :sportsmen do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :sportsmen
  end
end
