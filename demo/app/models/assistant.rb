# frozen_string_literal: true

# Setup associations and validations for Assistant model
class Assistant < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :name, uniqueness: true

  # custom validations

  before_save :check_if_name_is_uppercase

  private

  def check_if_name_is_uppercase
    errors.add(:name, 'name is not uppercase') unless name.first.upcase == name.first
  end
end
