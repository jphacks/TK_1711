Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            root 'users#index'
        end
    end  
end
