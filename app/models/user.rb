class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :sportsman_attributes
  
  has_one :sportsman, dependent: :destroy
  accepts_nested_attributes_for :sportsman
  
  has_secure_password
  
  validates :email, uniqueness: true
  
  #alias for sportsman attrs
  def name
    sportsman.name if sportsman
  end
end
