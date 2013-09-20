class UserMailer < ActionMailer::Base
  default from: "prashantsingla01@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = "http://localhost:3000/users	"
  	mail(to: @user.email, subject:"Welcome to Ror")
  end
end
