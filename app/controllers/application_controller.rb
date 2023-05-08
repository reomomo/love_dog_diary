class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_beginning_of_week
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_up_path_for(resource)
    my_page_path
  end

  def after_sign_in_path_for(resource)
    my_page_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :user_name])
    end

  private
    def set_beginning_of_week
      Date.beginning_of_week = :sunday
    end

end
