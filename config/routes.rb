Rails.application.routes.draw do
  resources :stock_movements, only: [ :index, :new, :create ]
  resources :customers
  resources :orders do
    patch :update_status, on: :member
  end
  resources :users, only: [ :create, :new ]
  resource :session
  resources :passwords, param: :token
  resources :organizations, only: [ :create, :new ]
  resources :suppliers do
    get "purchase_orders", on: :member, to: "suppliers#purchase_orders"
  end
  resources :stocks, except: :show
  resources :warehouses do
    resources :stocks, only: :index
  end
  resources :categories, only: [ :index, :new, :create ]
  resources :products
  resources :invitations, only: [ :index, :new, :create ] do
    post :resend, on: :member
  end
  resources :employees, only: [ :index ] do
    patch :desactivate, on: :member
    patch :activate, on: :member
  end
  resources :homes, only: :index
  get "home", to: "homes#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "products#index"
end
