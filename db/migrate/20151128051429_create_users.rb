class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :icon_url
      t.integer :twitter_id

      t.timestamps null: false
    end
  end
end
