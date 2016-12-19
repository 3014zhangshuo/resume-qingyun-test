class TestersController < ApplicationController

	def index
		@tester = Tester.all
	end

	def new
		@tester = Tester.new
	end

	def create
		@tester = Tester.new(tester_params)
		@tester.save

		redirect_to new_user_resume_path, notice: "感谢您的填写，我们会在测试版上线时第一时间与您邮件联系，请您定时查看邮箱"
	end


private

	def tester_params
		params.require(:tester).permit(:name, :email)
	end

end
