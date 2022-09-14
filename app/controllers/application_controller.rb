class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :notifications

  def notifications
    @requests = FriendRequest.my_friend_requests(current_user) if current_user
  end

end
