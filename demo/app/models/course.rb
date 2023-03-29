class Course < ApplicationRecord
  has_many :assistants, as: :commentable
end

