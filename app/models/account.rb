class Account < ApplicationRecord
  # belongs_to :user
  has_many :posts

  # validates :name, :password, presence: true
  # validates :password, length: (3..8)
  # validates :name, format: { :multiline => true, with: /^([a-zA-Z\\s]+|[\\p{L}\\s]+)$/ }

#   before_save :capitalize_name
#   # before_validation :remove_whitespaces

# private 

# def capitalize_name
#   self.name = name.capitalize
# end

# def remove_whitespaces
#   name.strip!
# end
end
