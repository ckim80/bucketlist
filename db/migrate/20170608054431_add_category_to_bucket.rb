class AddCategoryToBucket < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :category, :string
  end
end
