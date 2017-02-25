class Image < ApplicationRecord
  validates :name, length: { minimum: 3 }, uniqueness: true
end
