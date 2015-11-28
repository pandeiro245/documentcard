class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :content
      t.integer :parent_id
      t.references :user, index: true, foreign_key: true
      t.integer :position
      t.integer :style_id

      t.timestamps null: false
    end
  end
end
