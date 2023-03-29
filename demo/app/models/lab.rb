class Lab < ApplicationRecord
  has_many :assistants, as: :commentable
end
