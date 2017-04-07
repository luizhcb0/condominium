Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#index"
  # resources :static
  get "/get_time", to: "static#get_time", as: "get_time"
  
  # Para funcionar, tem que mudar no JS para static/get_time
  # get 'static/index'
  # get 'static/get_time'


end
