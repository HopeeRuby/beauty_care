# frozen_string_literal: true

# Setup associations and validations for Profile model
class Profile < ApplicationRecord
  belongs_to :user

  validates :phone, length: { is: 10 }
  validates :phone, uniqueness: true
  validates :phone, format: { with: /[0-9]/, message: 'only allow number' }

  # custom validations
  validate :sex_not_match
  before_update :check_phone

  private

  def sex_not_match
    errors.add(:sex, 'sex does not match') unless %w[male female].include?(sex)
  end

  def check_phone
    errors.add(:phone, 'phone have been used') if Profile.find_by phone: phone
  end
end
