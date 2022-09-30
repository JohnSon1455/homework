Rails.application.routes.draw do
  root "static#welcome"
  resources :tasks
  resources :buckets
	resources :users, only: [:create] do
		collection do
			get :sign_up   
			get :sign_in
		end
	end
	post "/users/sign_in", to: "sessions#create", as: "login"
	delete "/users", to: "sessions#destroy", as: "logout"
end
