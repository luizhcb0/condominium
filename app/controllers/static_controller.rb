class StaticController < ApplicationController
  
  def index
    @time = DateTime.now
  end
  
  def get_time
    @time = DateTime.now
    render partial: "date"
  end
  
end
