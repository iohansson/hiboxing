class CreateGyms < ActiveRecord::Migration
  def self.up
    create_table :gyms do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.float :latitude
      t.float :longitude
      t.time :opens_at
      t.time :closes_at
      t.timestamps
    end
  end

  def self.down
    drop_table :gyms
  end
end
