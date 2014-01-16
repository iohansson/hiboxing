class Coach < ActiveRecord::Base
  attr_accessible :description, :image, :name
  mount_uploader :image, ImageUploader
  validates :name, presence: true
end
