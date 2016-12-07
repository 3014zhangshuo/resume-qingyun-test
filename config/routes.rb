Rails.application.routes.draw do
  devise_for :users
  root 'welcome#show'

  resources :welcomes do
  end

  get 'welcome/pdf' => 'welcome#download'
end
