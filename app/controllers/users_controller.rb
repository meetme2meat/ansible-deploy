class UsersController < ApplicationController

  def forgot_password
  end

  def reset_password
    @user = User.find_by(email: params[:email])
    respond_to do |format|
      if @user.present?
        @user.reset_password(@user)
        #redirect_to root_path
        format.html { redirect_to root_path, notice: 'Reset Password.' }
        format.js { render json: {success: true,  location: @user} }
      else
        format.html { render :template => 'users/forgot_password.html.erb',:notice => "No Email Associated" }
        format.js { render json: {success: false, errors:  "No Email Associated"} }
        #flash[:notice] = "No Email Associated"
        #render :template => 'users/forgot_password.html.erb'
      end
    end
  end
end