class ExtrasController < ApplicationController
	def index
	@posts = Post.where(id_serie: 5).order("created_at DESC")
	end
end
