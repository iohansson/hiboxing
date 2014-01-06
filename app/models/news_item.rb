class NewsItem < ActiveRecord::Base
  attr_accessible :text, :title
  
  validates :title, presence: true
  validates :text, presence: true
end
