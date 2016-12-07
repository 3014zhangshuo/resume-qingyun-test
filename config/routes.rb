Rails.application.routes.draw do
  devise_for :users



  resources :welcomes do
  end

  get 'user/resumes/pdf' => 'user/resumes#download'

  root 'welcome#index'


  # 用户下简历路由
  namespace :user do
    resources :resumes do
    	get :preview
    end
  end


end
