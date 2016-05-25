class DashboardController < ApplicationController
  def index
	  	@post_ups = current_user.find_up_voted_items
	  	@post_downs = current_user.find_down_voted_items
  end
end
