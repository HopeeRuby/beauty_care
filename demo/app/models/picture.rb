# frozen_string_literal: true

# Setup associations and validations for Picture model
class Picture < ApplicationRecord
  belongs_to :posts
end
