class AddBodyToBucket < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :body, :text
  end
end
