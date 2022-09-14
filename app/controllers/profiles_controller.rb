class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    if current_user.create_profile(profile_params)
      redirect_to user_path(current_user), notice: "Profile created!"
    else
      redirect_to root_path, alert: "Something went wrong:("
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(current_user.id)
    if @profile.update(profile_params)
      redirect_to user_path(current_user), notice: "Profile updated!"
    else
      redirect_to root_path, alert: "Something went wrong:("
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :last_name, :dob, :address)
  end
end
