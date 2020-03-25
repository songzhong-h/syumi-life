class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_seach




  def set_seach
    @q = Category.order(created_at: :desc).ransack(params[:q])
    @categories = @q.result
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
