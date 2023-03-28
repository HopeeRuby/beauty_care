class User < ApplicationRecord
  belongs_to :company
  has_many :posts
  has_one :profile
end
