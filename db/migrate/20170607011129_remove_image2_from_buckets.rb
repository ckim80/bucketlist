class RemoveImage2FromBuckets < ActiveRecord::Migration[5.1]
  def change
    remove_column :buckets, :image2, :string
  end
end
