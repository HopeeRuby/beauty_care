class Profile < ApplicationRecord
  belongs_to :user
  has_many :images, as: :img
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, numericality: true
  validates :phone, presence: true
end
