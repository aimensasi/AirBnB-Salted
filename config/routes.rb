Rails.application.routes.draw do

  resources :transactions, only: [:new, :create]
  resources :search_enigne, only: [:new, :create]
  #clearance Routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  #reservation route
  resources :listings, :only => [:create] do 
    resources :reservations, :only => [:create]
  end

  resources :reservations, :only => [:update, :destroy, :edit, :update]

  #authenticate with facebook route
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  #user route
  resources :users, only: [:show, :edit, :update, :destroy] 
  #destroy user's avatar 
  delete "/users/:id/destroy_avatar" => "users#destroy_avatar"

  #reservation route
  resources :listings
  root 'listings#index'  

end
