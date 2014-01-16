PersonalApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


	resources :sessions, only: [:new, :create, :destroy]
	
  root 'static_pages#home'
	match '/about',   to: 'static_pages#about', via: 'get'
	match '/signin',  to: 'sessions#new'      , via: 'get'
	match '/signout', to: 'sessions#destroy'  , via: 'delete'
end
