class Image < ApplicationRecord
   has_many :comments, dependent: :destroy
   has_many :users
  validates :name, length: { minimum: 3 }, uniqueness: true
end
