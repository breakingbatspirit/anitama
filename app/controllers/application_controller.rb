class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

    # オートコンプリート用
    protect_from_forgery with: :exception
    # 第 1 引数 => model名 :user (必須)
    # 第 2 引数 => column名 :name (必須)
    # 第 3 引数 => オプション full: true (任意)
    autocomplete :anime, :anime_title # 追加
    autocomplete :label, :label_name # 追加
    autocomplete :aritist, :artist_name # 追加

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:namekana,:nickname,:postal,:address,:phone,:email])
  end
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
end

