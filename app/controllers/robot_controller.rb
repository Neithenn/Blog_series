class RobotController < ApplicationController
	def index
	@posts = Post.where(id_serie: 3).order("created_at DESC")
	end
end
