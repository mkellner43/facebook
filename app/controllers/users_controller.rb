class UsersController < ApplicationController
  def index
    @users = User.all
    @my_requests = Friendship.my_friend_requests(current_user.id)
    @requests = Friendship.friend_requests(current_user.id)
    @friends_list = Friendship.current_friends(current_user.id)
  end

  def friend_request
    @user = User.find(current_user.id)

    if @user.friendships.create(friend_id: params[:id], status: "pending")
      redirect_to root_path, notice: "Friend request sent!"
    else
      redirect_to root_path, alert: "Something went wrong :("
    end
  end

  def accept_friend_request
    @friend_request = Friendship.find(params[:id])
    if @friend_request
      @friend_request.update(status: "accepted")
      redirect_to root_path, notice: "You have a new friend!"
    else
      redirect_to root_path, notice: "Something went wrong:( "
    end
  end

  def delete_friend_request
    @friend_request = Friendship.find(params[:id])
    if @friend_request
      @friend_request.destroy
      redirect_to root_path, notice: "Not your friend!"
    else
      redirect_to root_path, notice: "Something went wrong:( "
    end 
  end

  def notifications
    @notifications = Friendship.friend_requests(current_user.id)
  end

end
