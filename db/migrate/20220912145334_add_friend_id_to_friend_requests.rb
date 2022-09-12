class AddFriendIdToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :friend_id, :bigint
    add_index :friend_requests, :friend_id
  end
end
