class Group < ActiveRecord::Base
  attr_accessible :name, :num_trainings, :days
  
  validates :name, presence: true, uniqueness: true
  validates :num_trainings, presence: true
  validates :days, presence: true
  
  has_many :subs
  has_many :sportsmen, through: :subs
  
  def price
    super || "Бесплатно"
  end
  
  def subs_with_sportsmen
    subs.includes(:sportsman)
  end
  
  def active_subs_with_sportsmen
    subs_with_sportsmen.active
  end
  
  def inactive_subs_with_sportsmen
    subs_with_sportsmen.inactive
  end
end
