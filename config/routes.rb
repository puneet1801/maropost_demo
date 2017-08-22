Rails.application.routes.draw do
  resources :galleries do
  	member do
  		post :update_name   
  	end
    collection do
      post :import_csv
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'home#about_us'

  get  'home/about_us'
  get  'home/contact_us'
  post 'home/contact_form'

  namespace :api, defaults: {format: 'json'} do
    post 'create_user'    => 'home#create_user'
    post 'create_gallery' => 'home#create_gallery'
    post 'contact_form'   => 'home#contact_form'
    get  'gallery/:id'    => 'home#get_gallery'
  end
end
