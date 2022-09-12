class FriendRequest < ApplicationRecord
  belongs_to :user

  scope :my_friend_requests, ->(id) { where("friend_id = ?", id) }
  scope :friend_requests, ->(id) { where("user_id = ?", id) }


  # scope :friend_requests, ->(id) { where( "friend_id = ?", id) }
end
