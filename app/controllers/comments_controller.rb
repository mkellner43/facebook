class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end
  
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to root_path, notice: "Comment posted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

end
