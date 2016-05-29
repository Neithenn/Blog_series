class DashboardController < ApplicationController
  def index

  	if user_signed_in?
	  	@post_ups = current_user.find_up_voted_items
	  	@post_downs = current_user.find_down_voted_items
	else
		redirect_to root_path
	end	  	
  end
end
