Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      post :confirm
    end
  end
  namespace :welcome do
		get :entry
  end

  get 'user/standard_resume' => 'user/resumes#standard_resume' ##简历标注模板页
	get 'user/responsive_template' => 'user/resumes#responsive_template' ##可变化模板

  get 'user/resumes/pdf' => 'user/resumes#download'
  # get 'user/resumes/:resume_id/preview_pdf' => 'user/resumes#preview_download', as: :preview_download
  root 'welcome#index'

	namespace :admin do
		resources :users do
      member do
        post :sent_confirm_email
      end
      resources :resumes do
         get :preview
         post :save_html

           post :notify_user_edit_one_done
        
      end
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
			get :editor
      post :relay
      post :save_html
			post :first_submit
			post :second_submit
			post :complete_resume

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
