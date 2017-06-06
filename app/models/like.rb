class Like < ApplicationRecord
  belongs_to :bucket
  belongs_to :user

  validates :user_id, presence: true, uniqueness: {scope: :bucket_id, message: "already liked this bucket"}
  validates :bucket_id, :presence => true

end
