class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(permit_params)
		@post.save
		redirect_to @post
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to posts_url
	end

	private
		def permit_params
			params.require(:post).permit(:title, :text)
		end
end
