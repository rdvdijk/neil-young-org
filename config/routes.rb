NeilYoungOrg::Application.routes.draw do
  devise_for :users

  resources :links do
    resources :broken_link_reports, :as => :reports
  end

  namespace :admin do
    resources :links
  end

  root :to => "links#index"
end
