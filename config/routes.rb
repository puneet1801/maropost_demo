Rails.application.routes.draw do
  resources :galleries do
  	member do
  		post :update_name 
  	end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#about_us'

  get 'home/about_us'
  get 'home/contact_us'
  post 'home/contact_form'
end
