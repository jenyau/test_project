class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    if doctor_signed_in?
      @current_ability ||= Ability.new(current_doctor)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end
protected
  def after_sign_in_path_for(_resource)
    if current_user.present?
      if current_user.admin?
      else
        user_path(current_user)
      end
    elsif current_doctor.present?
      doctor_path(current_doctor)
    end
  end

    def configure_permitted_parameters
      added_attrs = [:phone_number, :name, :image, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
