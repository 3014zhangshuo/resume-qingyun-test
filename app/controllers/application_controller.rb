class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
=======

	def admin_required
		if !current_user.admin?
			redirect_to "/"
		end
	end
>>>>>>> f29594ce53bfd89231a55f4f47a68d4e711b3912
end
