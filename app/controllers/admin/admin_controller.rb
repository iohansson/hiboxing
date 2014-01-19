class Admin::AdminController < Admin::ApplicationController
  before_filter :authorize

  def index
  end
end
