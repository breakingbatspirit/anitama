class ApplicationController < ActionController::Base


	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
	def self.render_with_signed_in_user(user, *args)
		ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
		proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
		renderer = self.renderer.new('warden' => proxy)
		renderer.render(*args)
		# chatchannelで使用しているtemplateに定義されているapplicationcontrollerを
		# 使用できるようにするための記述。
		# channelではcurrent_userが使用できないからそれを適用させないようにするための記述
	end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:namekana,:nickname,:postal,:address,:phone,:email])
  end
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定

  end
end

