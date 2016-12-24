class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def admin_required
		if !current_user.admin?
			redirect_to "/"
		end
	end

	def after_sign_up_path_for
		user_resumes_path
	end

	def after_sign_in_path_for(resource)
		user_resumes_path
	end

	private

	def resource_name
		:user
	end
	helper_method :resource_name

	def resource
		@resource ||= User.new
	end
	helper_method :resource

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
	helper_method :devise_mapping

	def resource_class
		User
	end
	helper_method :resource_class

end
