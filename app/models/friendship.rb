class Friendship < ApplicationRecord
  belongs_to :user

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { user_id: friend_id, friend_id: user_id }
  end

  scope :current_friends, ->(id) { where("friend_id = ?", id) }
end

#just probs fixed friending. messed with Friendship --> no more status that was moved to 
# friend request -- bi direectional relationship seems to be working okay. 
# will need to fix ways to check if friend request is pending through friend request model
# will need to fix ways to check if you are friends with someone and display posts if they are (: