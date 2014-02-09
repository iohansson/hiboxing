class AddAuthToSportsmen < ActiveRecord::Migration
  def change
    add_column :sportsmen, :email, :string
    add_column :sportsmen, :password_digest, :string
  end
end
