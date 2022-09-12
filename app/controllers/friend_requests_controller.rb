class FriendRequestsController < ApplicationController

  def friend_request
    @user = User.find(current_user.id)
    @requested_user = User.find(params[:id])
    unless request_not_allowed?(@requested_user)
      @user.friend_requests.create(friend_id: @requested_user.id)
      redirect_to root_path, notice: "Friend request sent!"
    else
      redirect_to root_path, alert: "Something went wrong :("
    end
  end

  def accept_friend_request
    @friend_request = FriendRequest.find(params[:id])
    current_user.friendships.create( friend_id: @friend_request.user_id )
    @friend_request.destroy
    redirect_to root_path, notice: "You have a new friend!"
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

  private

  def request_not_allowed?(friend)
   friend.id == current_user.id or current_user.friendships.current_friends(friend).exists? or FriendRequest.my_friend_requests(friend).exists? or FriendRequest.my_friend_requests(current_user).exists?
  end
end
