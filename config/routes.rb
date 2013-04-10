Rails3BootstrapDeviseCancan::Application.routes.draw do
  get "contacts_servers/assign"

  resources :contacts


  authenticated :user do
    root :to => 'servers#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :servers
  resources :contacts
  resources :users, :only => [:show, :index]

  resources :servers do
    resources :contacts_servers
  end

  resources :contacts_servers
  match "servers/:server_id/contacts_servers/assign" => "contacts_servers#assign", as: :assign 
  match "servers/:server_id/contacts/:id" => "contacts#destroy", as: :destroy

	namespace :api do
		namespace :v1  do
	  	resource :sessions, only: [:create, :destroy]
	  	resources :servers, except: [:new, :edit]
      match 'sessions', :controller => 'sessions', :action => 'destroy', :constraints => {:method => 'OPTIONS'}
	  end
	end
end