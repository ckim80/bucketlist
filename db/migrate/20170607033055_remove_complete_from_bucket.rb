class RemoveCompleteFromBucket < ActiveRecord::Migration[5.1]
  def change
    remove_column :buckets, :complete, :boolean
  end
end
