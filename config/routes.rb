Rails.application.routes.draw do
  get "daily_responses/new"
  get "daily_responses/create"
  get "daily_responses/index"
  get "users/new"
  get "users/create"
  get "users/show"
  # ログイン関係
  get    'login',  to: 'sessions#new'     # ログイン画面
  post   'login',  to: 'sessions#create'  # ログイン処理
  delete 'logout', to: 'sessions#destroy' # ログアウト

  # ユーザー登録関係
  resources :users, only: [:new, :create, :show]
  # 日記関係
  resources :daily_responses, only: [:new, :create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
