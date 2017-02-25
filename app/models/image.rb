class Image < ApplicationRecord
   has_many :comments, dependent: :destroy
  has_many :users
  has_many :comments
  has_many :likes
  validates :name, length: { minimum: 3 }, uniqueness: true
end
