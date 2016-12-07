Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'


  # 用户下简历路由
  namespace :user do
    resources :resumes do
    	get :preview
    end
  end

end
