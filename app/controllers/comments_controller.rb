class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
        comment = @post.comments.build(comment_params)
  	comment.save
  	redirect_to comment.post
  end

  def destroy
  end

  private
  	def comment_params
  		params.require(:comments).permit(:content, :name, :email)
  	end

end
