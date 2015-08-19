class Users::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #  super
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def create
    resource = warden.authenticate!(:scope => resource_name)
    sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)} and return
  end

  # def failure
  #   render :json => {:success => false, :errors => "Login failed."} and return
  # end
  protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:password , :login)
    end
   end
end
