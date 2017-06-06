class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buckets
  has_many :likes
  has_many :comments

  validates :username, :presence => true, :uniqueness => true

  acts_as_messageable
  
end
