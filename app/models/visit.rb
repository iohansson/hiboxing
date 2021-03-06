class Visit < ActiveRecord::Base
  attr_accessible :sub_id
  
  belongs_to :sub
  
  validate :only_once_a_day_for_sub
  
  before_create :initial_values
  after_create :update_sub
  
  protected
  
  def initial_values
    self.day = Time.now.beginning_of_day
  end
  
  def update_sub
    self.sub.points += 5
    self.sub.trainings_left -= 1
    self.sub.save
  end
  
  #validators
  def only_once_a_day_for_sub
    if Visit.find_by_sub_id_and_day(sub_id, Time.now.beginning_of_day)
      errors.add(:sub_id, "Нельзя отмечать один абонемент два раза в день")
    end
  end
end
