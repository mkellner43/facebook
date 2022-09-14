module PostsHelper

  def is_a_friend(friend)
    Friendship.current_friends(friend.id, current_user.user_id)
  end
end
