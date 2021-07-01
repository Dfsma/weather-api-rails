Rails.application.routes.draw do
  

  
  resources :weather do
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
