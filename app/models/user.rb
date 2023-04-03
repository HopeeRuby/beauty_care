# frozen_string_literal: true

# this class represents the employee name in the company
class User < ApplicationRecord
  belongs_to :company
  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, update_only: true, allow_destroy: true
  accepts_nested_attributes_for :posts, allow_destroy: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  before_validation :remove_whitespaces
  after_validation :log_validation_status
  before_destroy :cancel_subscription
  after_destroy :notify_admin

  private

  def remove_whitespaces
    name.strip!
  end

  def log_validation_status
    Rails.logger.info("User #{id} validate")
  end

  def cancel_subscription
    subscription.cancel
  end

  def notify_admin
    AdminMailer.user_deleted(self).deliver_now
  end
end
