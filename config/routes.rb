Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'servers#index'
  end
  root :to => "servers#index"
  devise_for :users
  resources :servers
  resources :users, :only => [:show, :index]
end
