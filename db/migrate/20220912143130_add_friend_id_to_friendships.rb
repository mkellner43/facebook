class AddFriendIdToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :friend_id, :bigint
    add_index :friendships, :friend_id
  end
end
