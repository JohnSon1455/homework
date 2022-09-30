Rails.application.routes.draw do
  root "static#welcome"
  resources :tasks
  resources :buckets
	resources :users, only: [:create] do
		collection do
			get :sign_up   
		end
	end
end
