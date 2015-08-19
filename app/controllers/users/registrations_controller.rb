class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { success: true,  location: @user }
        #redirect_to root_path, notice: 'Sign up successfully'
      else
        format.html { render action: 'new' }
        format.json { success: false , errors: @user.errors }
      end
    end
    #super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private 
    def user_params
      params.require(:user).permit(:username ,:first_name ,:last_name ,:email,:gender,:password,:password_confirmation)
    end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name ,:last_name ,:gender ,:username,:password ,:password_confirmation,:email)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
