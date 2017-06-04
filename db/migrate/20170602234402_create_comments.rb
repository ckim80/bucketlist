class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :bucket_id

      t.timestamps

    end
  end
end
