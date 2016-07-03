class HomeController < ApplicationController

def index
	@posts = Post.all.limit(30).order("updated_at desc")
end
end
