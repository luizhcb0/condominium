class Level < ApplicationRecord
  belongs_to :box
  
  def self.get_current_level
    where(id: Level.maximum(:id)).first
  end
  
  def self.get_all_levels
    where(id: Level.maximum(:id)).first
  end
  
end
