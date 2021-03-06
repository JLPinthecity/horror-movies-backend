Rails.application.routes.draw do

  root 'home#index'

  post "api/v1/login", to: "api/v1/sessions#create"
  delete "api/v1/logout", to: "api/v1/sessions#destroy"
  post "api/v1/signup", to: "api/v1/users#create"
  get "api/v1/get_current_user", to: "api/v1/sessions#get_current_user"

  namespace :api do
    namespace :v1 do
      resources :reviews, :only => [:create, :destroy]
      resources :horror_movies, param: :slug
      resources :users do
        resources :genres
        resources :horror_movies, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#param: overrides the :id identifier used to generate routes
#for use in controller... Video.find_by(identifier: params[:identifier])