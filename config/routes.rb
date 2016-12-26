Rails.application.routes.draw do
  devise_for :users

  namespace :welcome do
		get :entry
  end

  get 'user/standard_resume' => 'user/resumes#standard_resume' ##简历标注模板页

  get 'user/resumes/pdf' => 'user/resumes#download'
  # get 'user/resumes/:resume_id/preview_pdf' => 'user/resumes#preview_download', as: :preview_download
  root 'welcome#index'

	namespace :admin do
		resources :users do
			member do
				post :admin_state
				post :user_state
			end
		end
	end

  # 用户下简历路由
  namespace :user do
    resources :resumes do
    	get :preview
      post :relay
      post :save_html
      
      # 分页
      collection do
        post :upload_image
      end
      member do
        get :page1
        post :page1_commit
        get :page2
        post :page2_commit
        get :page3
        post :page3_commit
        get :page4
        post :page4_commit
        get :page5
        post :page5_commit
				get :page6
				post :page6_commit
				get :page7
				post :page7_commit
        get :finish
      end

    end
  end


end
