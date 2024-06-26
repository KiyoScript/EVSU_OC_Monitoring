Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/report/:range" => "report#show", as: :report

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, path: '', path_names: { sign_in: 'admin/sign_in'}
  # Defines the root path route ("/")

  resources :attendances
  resources :employees do
    collection { post :import }
  end
  resources :students do
    collection { post :import }
  end

  resources :department, except: %i[show]

  root 'dashboard#index'
end
