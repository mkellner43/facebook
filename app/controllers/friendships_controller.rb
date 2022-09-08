class FriendshipsController < ApplicationController

  def index
    @friends_list = Friendship.current_friends(current_user.id)
    @users = User.all
    @my_requests = Friendship.my_friend_requests(current_user.id)
  end

end
