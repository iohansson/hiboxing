class Sub < ActiveRecord::Base
  attr_accessible :group_id, :sportsman_id, :trainings_left, :until_date
  
  belongs_to :sportsman
  belongs_to :group
  
  before_create :update_group_options
  
  protected
  
  def update_group_options
    self.trainings_left = self.group.num_trainings
    self.until_date = Time.now + self.group.days.days
  end
end
