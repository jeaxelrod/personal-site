PersonalApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


	resources :sessions, only: [:new, :create, :destroy]
	resources :blogs
	resources :projects
	
  root 'static_pages#home'
	match '/about',   to: 'static_pages#about',   via: 'get'
	match '/contact', to: 'contact#new',         	via: 'get'
	match '/contact', to: 'contact#create',       via: 'post'
	match '/signin',  to: 'sessions#new'      ,   via: 'get'
	match '/signout', to: 'sessions#destroy'  ,   via: 'delete'
end
