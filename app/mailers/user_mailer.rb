class UserMailer < ApplicationMailer
  default from: 'facebook@facebook.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Facebook!')
  end
end
