class Coach < ActiveRecord::Base
  attr_accessible :description, :image, :name, :crop_w, :crop_h, :crop_x, :crop_y
  attr_accessor :crop_w, :crop_h, :crop_x, :crop_y
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  
  after_update :crop_image
  
  protected 
  
  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
