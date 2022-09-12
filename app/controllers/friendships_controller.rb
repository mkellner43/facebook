class FriendshipsController < ApplicationController

  def index
    @friends_list = current_user.friendships
    @users = User.all
    @requests = FriendRequest.my_friend_requests(current_user)
    @my_requests = FriendRequest.friend_requests(current_user)
  end

end
