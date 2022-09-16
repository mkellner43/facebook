class OmniauthController < ApplicationController
  # skip_before_action :authenticate_user!

  def facebook
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:notice] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to new_user_registration_url
  end

end
