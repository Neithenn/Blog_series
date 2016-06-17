class HomeController < ApplicationController

def index
	@posts = Post.all.limit(30).order("created_at desc")
end
end
