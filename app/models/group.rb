class Group < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: true
  
  def price
    super || "Бесплатно"
  end
end
