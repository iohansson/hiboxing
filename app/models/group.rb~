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
end
