class StaticController < ApplicationController
  
  def index

    @top_boxes = Box.get_top_boxes
    @bottom_boxes = Box.get_bottom_boxes
    @window = 4
    
  end
  
  def render_current_level
    id = Level.get_current_level(params[:box_id])
    @level = Level.find(id)
    render json: @level
  end
  
  def render_all_current_levels
    @levels = Array.new
    array = Level.get_all_current_levels
    array.each do |level|
      @levels << Level.find(level) if level.present?
    end
    render json: @levels
  end
  
  # def get_time
  #   @time = DateTime.now
  #   render partial: "date"
  # end
  
end
