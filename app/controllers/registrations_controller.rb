class RegistrationsController < ::Devise::RegistrationsController

  def create
    if verify_recaptcha or !ENV['SITE_KEY']
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords resource
      set_minimum_password_length
      flash[:alert] = "Please verify Captcha"
      respond_with_navigational(resource) { render :new}
    end
  end

  def after_sign_up_path_for(resource)
    new_user_session_path
  end
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
