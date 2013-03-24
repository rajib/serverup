Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'servers#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :servers
  resources :users, :only => [:show, :index]

	namespace :api do
		namespace :v1  do
	  	resource :sessions, only: [:create, :destroy]
	  	resources :servers, except: [:new, :edit]
      match 'sessions', :controller => 'sessions', :action => 'destroy', :constraints => {:method => 'OPTIONS'}
	  end
	end
end