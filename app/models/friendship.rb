class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: "friend_id"

  scope :current_friends, ->(id) { where( "status = ?", 'accepted').where("friend_id = ? or user_id = ?", id, id) }
  scope :my_friend_requests, ->(id) { where( "user_id = ? and status = ?", id, "pending") }
  scope :friend_requests, ->(id) { where( "friend_id = ? and status = ?", id, "pending") }

end
