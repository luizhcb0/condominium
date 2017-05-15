Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#index"
  resources :static
  
  # get "/get_time", to: "static#get_time", as: "get_time"
  get "/render_current_level/:box_id", to: "static#render_current_level", as: "render_current_level"
  get "/render_all_current_levels", to: "static#render_all_current_levels", as: "render_all_current_levels"
  
  # Para funcionar, tem que mudar no JS para static/get_time
  # get 'static/index'
  # get 'static/get_time'
  
  get "/get_time", to: "static#get_time", as: "get_time"
  
  get "/get_all_boxes_graph", to: "charts#get_all_boxes_graph", as: "get_all_boxes_graph"
  get "/get_box_graph/:id", to: "charts#get_box_graph", as: "get_box_graph"




end
