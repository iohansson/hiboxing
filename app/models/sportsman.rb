class Sportsman < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :password, :password_confirmation
  has_secure_password
  
  has_many :subs, dependent: :destroy
  has_many :visits, through: :subs
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-0-9a-z]+\.)+[a-z]{2,})\z/i
  
  #class methods
  def self.active
    joins(:subs).where('subs.trainings_left > 0 AND subs.until_date > :today', today: Time.now)
  end
  
  def self.inactive
    joins(:subs).where('subs.trainings_left = 0 OR subs.until_date <= :today', today: Time.now)
  end
  
  #instance methods
  def active_subs
    subs.active
  end
  
  def inactive_subs
    subs.inactive
  end
end
