NeilYoungOrg::Application.routes.draw do
  devise_for :users

  resources :links

  namespace :admin do
    resources :links
  end

  root :to => "links#index"
end
