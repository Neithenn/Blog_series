class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate, :except => [:index, :show, :upvote, :downvote ]

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
			reward_user
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
		if current_user.voted_down_on? @post
			@post.upvote_from current_user
		else
			@post.upvote_from current_user
			

			if @post.vote_registered?
				puntos = current_user.points + 100
				current_user.update_attributes(:points => puntos)
			end
		end	
		redirect_to post_path
	end

	def downvote

	if current_user.voted_up_on? @post
		@post.downvote_from current_user
	else
		@post.downvote_from current_user

		if @post.vote_registered?
			puntos = current_user.points + 100
			current_user.update_attributes(:points => puntos)
		end
	end
		redirect_to post_path
	end

private

def post_params
	params.require(:post).permit(:title, :content, :id_serie, :id_status, :id_type, :slug, :img, :written_by, :desc_serie, :points, :confirmar)
end

def find_post
	@post = Post.friendly.find(params[:id])
end

def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == "usuarioadmin" && password == "ameliemlp"
     end
end

def reward_user
	
	if @post.id_status == 2 && @post.confirmar == 2
		users = @post.votes_for.up.by_type(User).voters
		puntos = @post.points

		users.each do |user|
			new_points = user.points + puntos
			User.find(user.id).update( points: new_points)
			UserNotifier.send_notification_confirmation(user, @post).deliver 

		end

	elsif @post.id_status == 3 && @post.confirmar == 2

		users = @post.votes_for.down.by_type(User).voters
		puntos = @post.points

		users.each do |user|
			new_points = user.points + puntos
			User.find(user.id).update( points: new_points)
			UserNotifier.send_notification_rejected(user, @post).deliver  
		end	 	 
	end
end
end
