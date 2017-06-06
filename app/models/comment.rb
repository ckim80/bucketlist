class Comment < ApplicationRecord
  belongs_to :bucket
  belongs_to :user

  validates :user_id, :presence => true
  validates :bucket_id, :presence => true
  validates :body, :presence => true

end
