class ApplicationController < ActionController::Base


	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:namekana,:nickname,:postal,:address,:phone,:email])
  end
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
end

