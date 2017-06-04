class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|
      t.integer :user_id
      t.string :image
      t.text :caption
      t.date :deadline
      t.string :image2
      t.string :location
      t.string :price_range

      t.timestamps

    end
  end
end
