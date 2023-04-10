class Product < ApplicationRecord
  self.per_page = 5

  validates :name, presence: true
end
