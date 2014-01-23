class DashboardController < ApplicationController
  before_filter { |c| c.authorize false }

  def index
    @user = current_user
  end
end
