class AddPriceAndDescriptionToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :price, :integer
    add_column :groups, :description, :string
  end
end
