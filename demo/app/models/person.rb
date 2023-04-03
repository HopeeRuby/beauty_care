class Person < ApplicationRecord
  has_one :address
  has_many :pets
  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :pets, allow_destroy: true, update_only: true
end
