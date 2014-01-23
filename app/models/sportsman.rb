class Sportsman < ActiveRecord::Base
  attr_accessible :name, :phone
  
  belongs_to :user
  has_many :subs, dependent: :destroy
  
  def self.active
    joins(:subs).where('subs.trainings_left > 0 AND subs.until_date > :today', { today: Time.now })
  end
  
  def self.inactive
    joins(:subs).where('subs.trainings_left = 0 OR subs.until_date <= :today', { today: Time.now })
  end
end
