class StaticController < ApplicationController
  
  def index

    @top_tanks = Tank.get_top_tanks
    @bottom_tanks = Tank.get_bottom_tanks
    @window = 4
    
  end
  
  def render_current_level
    id = Level.get_current_level(params[:tank_id])
    @level = Level.find(id)
    render json: @level
  end
  
  def render_all_current_levels
    @levels = Array.new
    array = Level.get_all_current_levels
    # Rails.logger.debug("Array: #{array.inspect}")
    array.each do |level|
      @levels << Level.find_by(id: level) if level
    end
    render json: @levels
  end
  
  # def get_time
  #   @time = DateTime.now
  #   render partial: "date"
  # end
  
end
