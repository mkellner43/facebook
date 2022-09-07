class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def notifications
    @requests = Friendship.friend_requests(current_user.id)
  end
end
