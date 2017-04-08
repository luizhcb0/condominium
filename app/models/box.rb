class Box < ApplicationRecord
  has_many :levels
  
  enum position: %w(top bottom)
  
  def self.get_top_boxes
    where(position: "top")
  end
  
  def self.get_bottom_boxes
    where(position: "bottom")
  end
end
