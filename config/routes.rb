Rails.application.routes.draw do
  devise_for :users



  resources :welcomes do
  end

  get 'user/resumes/pdf' => 'user/resumes#download'
  get 'user/resumes/:resume_id/preview_pdf' => 'user/resumes#preview_download', as: :preview_download
  root 'welcome#index'


  # 用户下简历路由
  namespace :user do
    resources :resumes do
    	get :preview
      # 分页
      collection do
        get :page1
        post :page1_commit
      end
      member do
        get :page2
        post :page2_commit
        get :page3
        post :page3_commit
        get :page4
        post :page4_commit
        get :page5
        post :page5_commit
        get :finish
      end

    end
  end


end
