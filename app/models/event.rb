class Event < ActiveRecord::Base
  belongs_to :group
  serialize :start, Tod::TimeOfDay
  serialize :stop, Tod::TimeOfDay
  attr_accessible :day, :group_id, :start, :stop
  
  validate :group_exists
  
  def self.current
    day = Time.now.wday
    day = 7 if day == 0
    where('day = :day AND start <= :time AND stop >= :time',{day: day, time: Time.now.to_time_of_day.to_s})
  end
  
  def self.next_today
    day = Time.now.wday
    day = 7 if day == 0
    where('day = :day AND start >= :time',{day: day, time: Time.now.to_time_of_day.to_s}).order(:start)
  end
  
  def self.next_this_week
    day = Time.now.wday
    day = 7 if day == 0
    where('(day = :day AND start >= :time) OR (day > :day)',{day: day, time: Time.now.to_time_of_day.to_s}).order(:day,:start)
  end
  
  def self.next_next_week
    day = Time.now.wday
    day = 7 if day == 0
    where('day < :day', {day: day}).order(:day,:start)
  end
  
  def self.next
    return next_today.first if next_today.count > 0
    return next_this_week.first if next_this_week.count > 0
    return next_next_week.first if next_next_week.count > 0
    return false
  end
  
  def closest_date
    day = 0 if day == 7
    Date.commercial(Date.today.year, 1+Date.today.cweek, self.day)
  end
  
  def name
    self.group.name
  end
  
  def price
    self.group.price
  end
  
  def description
    self.group.description
  end
  
  def duration
    #duration in minutes
    (self.stop.second_of_day-self.start.second_of_day)/60
  end
  
  def data_json
    self.as_json(except: [:created_at, :updated_at, :stop, :start]).merge(duration: self.duration, start: self.start.second_of_day/60)
  end
  
  protected
  
  def group_exists
    errors.add(:group_id, "Не указана группа") if Group.find_by_id(self.group_id).nil?
  end
end
