class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Michef's!")
  end

  def forgot_password_email(user,password)
    @user = user
    @generated_password = password
    mail(to: @user.email, subject: "Reset Password")
  end
end
