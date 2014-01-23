class Sportsman < ActiveRecord::Base
  attr_accessible :name, :phone
  
  belongs_to :user
end
