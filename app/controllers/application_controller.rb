class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana, :first_kana, :postal_code, :domicile, :phone_number,:password,:password_confirmation])
  end

  def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_items_path
  when EndUser
    public_end_user_path(current_end_user)
  end
end

def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_end_user_session_path
    end
  end

end
