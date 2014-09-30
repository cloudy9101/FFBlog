class PostsController < ApplicationController
	before_action :require_login , only: [:create, :destroy]
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 10 )
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(permit_params)
		if @post.save
			flash[:success] = "文章发布成功！"
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(permit_params)
			flash[:success] = "文章更新成功！"
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "文章删除成功！"
		redirect_to current_user
	end

	private
		def permit_params
			params.require(:post).permit(:title, :text)
		end

		def require_login
			unless signed_in?
				flash[:error] = "You must be logged in."
				redirect_to signin_path
			end
		end
end
