class CreateGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :url, null: false
      t.integer :rating, null: false, default: 0

      t.timestamps
    end
  end
end
