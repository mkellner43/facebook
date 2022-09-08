class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    unless already_liked?
      @post.likes.create(user_id: current_user.id)
      redirect_to root_path, notice: "Liked!"
    end
  end

  def destroy
    if already_liked?
      @like = @post.likes.find(params[:id])
      @like.destroy
      flash[:notice] = "unliked!"
    end
    redirect_to root_path
  end

  private

  def already_liked?
    @post = Post.find(params[:post_id])
    @post.likes.where(user_id: current_user.id).exists?
  end
  
end