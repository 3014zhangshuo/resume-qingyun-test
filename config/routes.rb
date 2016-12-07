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
    end
  end


end
