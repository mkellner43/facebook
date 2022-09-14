module ApplicationHelper
  def user_avatar(user, size=40)
    if user.profile and user.profile.avatar.attached?
      user.profile.avatar.variant(resize: "[#{size}, nil]")
    else
      user_gravatar(user)
    end 
  end
end
