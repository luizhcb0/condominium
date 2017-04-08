class StaticController < ApplicationController
  
  def index
    # @time = DateTime.now
    @boxes = Box.all
  end
  
  def render_current_level
    @level = Level.get_current_level
    render json: @level.level
  end
  
  def render_all_levels
    @levels = Level.get_all_levels
    render json: @levels
  end
  
  # def get_time
  #   @time = DateTime.now
  #   render partial: "date"
  # end

  
end
