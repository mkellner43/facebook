class PostsController < ApplicationController

  def index
    @post = Post.new
    @users = User.all
    @posts = Post.all.order("created_at DESC")
    @comments = Comment.all.order("created_at DESC")
    @my_requests = FriendRequest.my_friend_requests(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to @post, notice: "Check out your post!"
    else
      render :new, notice: "Something went wrong"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated"
    else
      redirect_to :edit, notice: "Something went wrong"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path, notice: "Post deleted"
    else
      redirect_to root_path, notice: "Something went wrong"
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:id, :body)
  end
end
