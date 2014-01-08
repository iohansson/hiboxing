class Admin::AdminController < ApplicationController
  before_filter :authorize

  def index
  end
end
