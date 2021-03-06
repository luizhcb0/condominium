class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.belongs_to :tank, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.integer :level, null: false
      t.timestamps
    end
  end
end
