class Tank < ApplicationRecord
  has_many :levels
  
  enum position: %w(top bottom)
  
  def self.get_top_tanks
    where(position: "top")
  end
  
  def self.get_bottom_tanks
    where(position: "bottom")
  end
end
