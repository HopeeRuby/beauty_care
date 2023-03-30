# frozen_string_literal: true

# This class represents a company including company name and location
class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  validate :validate_name, if: :name_not_blank?
  # before_validation :set_dafault_name, if: :name_not_blank?
  before_validation :remove_whitespaces
  validates :location, presence: true

  private

  def validate_name
    errors.add(:name, 'wrong name') if name.to_s.match?(/[0-9]/)
  end

  def name_not_blank?
    name.present?
  end

  def set_dafault_name
    self.name = 'default name'
  end

  def remove_whitespaces
    name.strip!
  end
end
