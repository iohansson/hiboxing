class Admin::ApplicationController < ApplicationController
  layout 'admin'
  
  before_filter { |c| c.authorize true } #require admin
end
