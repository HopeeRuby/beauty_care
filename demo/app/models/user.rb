# frozen_string_literal: true

# Setup associations and validations for User model
class User < ApplicationRecord
  belongs_to :company
  has_many :posts, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :name, :email, presence: true
  validates :name, :email, length: { maximum: 30 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, format: { with: /[a-zA-Z]/ }

  # custom validate field

  validate :email_with_true_format, if: :fields_not_blank?
  before_validation :name_downcase_format, :remove_whitespaces, if: :fields_not_blank?
  before_update :check_email_available

  private

  def email_with_true_format
    errors.add(:email, 'wrong format email') unless email.include?('@')
  end

  def fields_not_blank?
    name.present? && email.present?
  end

  def name_downcase_format
    name.downcase
  end

  def remove_whitespaces
    name.strip! 
    email.strip! 
  end

  def check_email_available
    errors.add(:email, 'email has been used') if User.find_by email: email
  end
end
