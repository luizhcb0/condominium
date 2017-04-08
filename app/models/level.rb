class Level < ApplicationRecord
  belongs_to :box
  
  def self.get_current_level(box_id)
    where(box_id: box_id).maximum(:id)
  end
  
  def self.get_all_current_levels
    @levels = Array.new
    Box.all.each do |box|
      @levels <<  where(box_id: box.id).maximum(:id)
    end
    return @levels
  end
  
end
