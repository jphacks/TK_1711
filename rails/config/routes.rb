Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :containers
            resources :users
            post "/login",to:"sessions#create"
        end
    end
    
    namespace :public do
        resources :payments
    end
end