class UserMailer < ApplicationMailer
  default from: 'matthew.kellner@outlook.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Facebook!')
  end
end
