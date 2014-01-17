class Event < ActiveRecord::Base
  belongs_to :group
  serialize :start, Tod::TimeOfDay
  serialize :stop, Tod::TimeOfDay
  attr_accessible :day, :group_id, :start, :stop
  
  validate :group_exists
  
  def self.current
    day = Time.now.wday
    day = 7 if day == 0
    Event.where('day = :day AND start <= :time AND stop >= :time',{day: day, time: Time.now.to_time_of_day.to_s})
  end
  
  def self.next
    day = Time.now.wday
    day = 7 if day == 0
    Event.where('day = :day AND start >= :time',{day: day, time: Time.now.to_time_of_day.to_s}).order(:start).first
  end
  
  def name
    self.group.name
  end
  
  def js_id
    [
      'event',
      self.id,
      self.day,
      self.start.second_of_day/60,
      (self.stop.second_of_day-self.start.second_of_day)/60,
      self.group_id
    ].join '-'
  end
  
  protected
  
  def group_exists
    errors.add(:group_id, "Не указана группа") if Group.find_by_id(self.group_id).nil?
  end
end