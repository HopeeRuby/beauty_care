class Company < ApplicationRecord
	has_many :users
	has_many :posts, through: :users
  validates :name, format: { :multiline => true, with: /^([a-zA-Z\\s]+|[\\p{L}\\s]+)$/ }

  before_save :uppercase_name

  def uppercase_name
	p name 
	self.name.upcase!
  end
end



