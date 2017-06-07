class AddDoneToBucket < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :done, :string
  end
end
