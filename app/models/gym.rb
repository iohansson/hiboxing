class Gym < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :email,
   :latitude, :longitude, :opens_at, :closes_at, :images_attributes
  
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  
  geocoded_by :address
  
  after_validation :geocode if :address_changed?
end
