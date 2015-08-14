class UsersController < ApplicationController

  def forgot_password
  end

  def reset_password
    @user = User.find_by(email: params[:email])
    if @user.present?
      @user.reset_password(@user)
      redirect_to root_path
    else
      flash[:notice] = "No Email Associated"
      render :template => 'users/forgot_password.html.erb'
    end
  end
end