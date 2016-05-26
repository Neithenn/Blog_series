class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	def index
	end

	def new
		@post = Post.new
	end

	def show
	end

	
	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "Salvado! sos groso"
		else
			render 'new', notice: "Oh no! Hubo un error no se pudo grabar"
		end		
	end	


	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Actualizado!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	#upvote from user
	def upvote
		@post.upvote_from current_user
		redirect_to post_path
	end

	def downvote
		@post.downvote_from current_user
		redirect_to post_path
	end

	def test
	
	end

private

def post_params
	params.require(:post).permit(:title, :content, :id_serie, :id_status, :id_type, :slug, :img, :written_by, :desc_serie)
end

def find_post
	@post = Post.friendly.find(params[:id])
end
end
