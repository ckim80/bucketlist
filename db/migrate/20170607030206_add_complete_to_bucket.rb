class AddCompleteToBucket < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :complete, :boolean
  end
end
