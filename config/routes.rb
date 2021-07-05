Rails.application.routes.draw do

  
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  
  resources :weathers do
    collection do
      post '/temperature', to: "weathers#create_temperature"
    end
    collection do
      post '/wind', to: "weathers#create_wind"
    end
    collection do
      post '/clouds', to: "weathers#create_cloud"
    end
  
  end
end
