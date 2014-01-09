class Page < ActiveRecord::Base
  attr_accessible :content, :is_published, :sort_order, :title
  
  validates :title, presence: true
  validates :content, presence: true
end
