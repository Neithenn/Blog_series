class TwdHomeController < ApplicationController
	def index
	@posts = Post.where(id_serie: 2).order("created_at DESC")
end
end
