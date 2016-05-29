class VikingsController < ApplicationController
	def index
	@posts = Post.where(id_serie: 4).order("created_at DESC")
	end
end
