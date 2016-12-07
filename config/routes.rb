Rails.application.routes.draw do
  devise_for :users



  resources :welcomes do
  end

  get 'welcome/pdf' => 'welcome#download'

  root 'welcome#index'


  # 用户下简历路由
  namespace :user do
    resources :resumes
  end


end
