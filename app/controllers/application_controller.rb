class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #before_action :inspect_user_is_confrim if current_user.nil? #验证用户是否通过验证

  #验证用户是否通过验证的action
  def inspect_user_is_confrim
    if current_user.user_code == current_user.confirm_code
      current_user.is_confirmed = true
      current_user.save!
    end
  end

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
