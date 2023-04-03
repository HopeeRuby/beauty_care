class Post < ApplicationRecord
  belongs_to :user
  belongs_to :account
  
  has_many :images
  
  validates_associated :images 
  validates :description, length: { minimum: 10 }
  validates :content, :length => {
    :minimum   => 10,
    :maximum   => 50,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }

end