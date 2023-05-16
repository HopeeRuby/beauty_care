# frozen_string_literal: true

class Admin < ApplicationRecord
  acts_as_paranoid
  has_many :users, dependent: nil
  before_save { self.email = email.downcase }
  before_save { self.phone = phone.to_s }

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :admin_deleted_soft_can_not_login
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A[0-9+]+\z/ }

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }

  def active_for_authentication?
    super && active? && !soft_deleted?
  end

  def admin_deleted_soft_can_not_login
    errors.add(:base, 'Your account has been soft-deleted and cannot log in.') if soft_deleted?
  end

  def avatar_medium_url
    avatar.url(:medium)
  end

  def avatar_small_url
    avatar.url(:small)
  end

  def soft_deleted?
    deleted_at.present?
  end
end
