class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    	user_path(current_user.id) # ログイン後に遷移するpathを設定
	end

	def after_sign_up_path_for(resource)
		user_path(current_user.id) # 新規登録後に遷移する
	end

	# def after_update_path_for(resource)
	# end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:password])
	end
end
