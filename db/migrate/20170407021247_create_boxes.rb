class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :resolution, null: false
      t.string :address, null: false
      t.integer :position, null: false
      t.integer :order, null: false
    end
  end
end
