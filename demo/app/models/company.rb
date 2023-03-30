# frozen_string_literal: true

# Setup associations and validations for Company model
class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :location, presence: true
  validates :name, :location,  length: { maximum: 30 }
  validates :name, uniqueness: { case_sensitive: false }

  # custom validate
  validate :name_without_errors, if: :name_not_blank?

  private

  def name_without_errors
    errors.add(:name, 'wrong input name') if name.to_s.match?(/[0-9]/)
  end

  def name_not_blank?
    name.present?
  end
end
