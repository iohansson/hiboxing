class Photo < ActiveRecord::Base
  attr_accessible :description, :image, :title
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :image, presence: true
end
