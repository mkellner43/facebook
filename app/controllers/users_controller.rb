class UsersController < ApplicationController
  
  def index
    @users = User.all
    @profile = Profile.where("user_id = ?", current_user.id)
    @friends_list = current_user.friendships
    @users = User.all
    @requests = FriendRequest.my_friend_requests(current_user)
    @my_requests = FriendRequest.friend_requests(current_user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @post = @user.posts.build
  end

end
