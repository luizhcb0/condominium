class CreateTanks < ActiveRecord::Migration[5.0]
  def change
    create_table :tanks do |t|
      t.belongs_to :user, index: true, foreign_key: {on_delete: :cascade}
      t.integer :resolution, null: false
      t.string :address, null: false
      t.integer :position, null: false
      t.integer :order, null: false
    end
  end
end
