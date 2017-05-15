class Level < ApplicationRecord
  belongs_to :tank
  
  def self.get_current_level(tank_id)
    where(tank_id: tank_id).maximum(:id)
  end
  
  def self.get_all_current_levels
    @levels = Array.new
    Tank.all.each do |tank|
      @levels <<  where(tank_id: tank.id).maximum(:id)
    end
    return @levels
  end
  
  def self.get_all_tanks_levels
    @levels = Array.new
    Tank.all.each do |tank|
      @levels <<  where(tank_id: tank.id)
    end
    return @levels
  end
  
  def self.get_all_levels(tank_id)
    @levels = where(tank_id: tank_id)
    return @levels
  end
  
end
