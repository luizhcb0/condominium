class ChartsController < ApplicationController
  
  def get_all_boxes_graph
    @hash = {}
    @array = Array.new
    @levels = Level.get_all_boxes_levels
    
    @levels.each do |l| 
      l.each do |i| 
        @hash[i.created_at] = i.level 
      end 
      @array << @hash 
      @hash = Hash.new 
    end
    
    render json: @array.each_with_index.map { 
      |a, index| { 
        name: "Caixa #{index + 1}", data: a 
      } 
    }
    
  end
  
  def get_box_graph
    box_id = params[:id]
    @hash = Hash.new
    @levels = Level.get_all_levels(box_id)
    
    @levels.each do |l|
      @hash[l.created_at] = l.level
    end

    render json: [{ name: "Caixa #{box_id}", data: @hash  }]  

  end
  
end
