# frozen_string_literal: true

# Setup associations and validations for Course model
class Course < ApplicationRecord
  has_many :assistants, as: :commentable, dependent: :destroy

  validates :subject, uniqueness: true
end
