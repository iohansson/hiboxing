class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_accessible :data
  
  mount_uploader :data, ImageUploader
end
