class UserMailer < ApplicationMailer
  default from: "perfectrez@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://perfectrez.heroku.com'
    mail(to: @user.email, subject: 'Welcome to PerfectRez')
  end

end
