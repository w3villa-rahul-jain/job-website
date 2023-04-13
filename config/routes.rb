Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  resources :users
  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "jobs#index"
  post '/apply_jobs', to: 'jobs#apply_jobs', as: "apply_jobs"
end
