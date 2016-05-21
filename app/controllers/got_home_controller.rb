class GotHomeController < ApplicationController
def index
	@posts = Post.where(id_serie: 1).order("created_at DESC")
end
end
