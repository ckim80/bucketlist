class Bucket < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :fans, :through => :likes, :source => :user

  belongs_to :user

  validates :user_id, :presence => true

  validates :image, format: {with: /\.(png|jpg)\Z/i}

end
