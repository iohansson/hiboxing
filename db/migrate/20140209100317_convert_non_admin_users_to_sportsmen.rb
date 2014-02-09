class ConvertNonAdminUsersToSportsmen < ActiveRecord::Migration
  def up
    Sportsman.all.each do |sportsman|
      user = User.find(sportsman.user_id)
      sportsman.email = user.email
      sportsman.password_digest = user.password_digest
      User.delete(user.id)
      sportsman.user_id = nil
      sportsman.save
    end
    remove_column :sportsmen, :user_id
  end

  def down
    add_column :sportsmen, :user_id, :integer
    Sportsman.all.each do |sportsman|
      user = User.create(email: sportsman.email, password: 'pass', password_confirmation: 'pass')
      user.password_digest = sportsman.password_digest
      user.save
      sportsman.user_id = user.id
      sportsman.save
    end
  end
end
