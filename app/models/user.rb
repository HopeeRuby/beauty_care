class User < ApplicationRecord
  belongs_to :company
  has_many :posts
  has_one :profile
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  before_validation :remove_whitespaces

  private
  
  def remove_whitespaces
    name.strip!
  end
end
