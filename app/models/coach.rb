class Coach < ActiveRecord::Base
  attr_accessible :description, :image, :name
  mount_uploader :image, CoachUploader
  validates :name, presence: true
  validates :image, presence: true
end
