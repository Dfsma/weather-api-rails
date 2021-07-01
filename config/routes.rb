Rails.application.routes.draw do
  

  
  resources :weathers do
    collection do
      post '/temperature', to: "weathers#create_temperature"
    end
  
  end
end
