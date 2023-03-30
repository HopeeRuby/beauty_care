# frozen_string_literal: true

# Setup associations and validations for Account model
class Account < ApplicationRecord
  belongs_to :user

  validates :account, :password, presence: true
  validates :account, :password, length: { in: 6..20 }
  validates :account, uniqueness: { case_sensitive: false }
  validates :account, :password, format: { with: /\A[a-zA-Z0-9]*\z/ }

  # custom validations
  validate :password_not_enough_strong
  after_destroy :log_destroy_result

  private

  def log_destroy_result
    Rails.logger.info 'Account has been destroyed'
  end

  def password_not_enough_strong
    errors.add(:password, 'Do not have upper letter, not enough strong') if password.downcase == password
  end
end
