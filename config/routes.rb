Rails.application.routes.draw do
  root "static#welcome"
  resources :tasks
  resources :buckets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
