# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :admin, optional: true
  before_save { self.email = email.downcase }
  before_save { self.phone = phone.to_s }

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A[0-9+]+\z/ }
  validates :address, presence: true
  enum status: {active: 0, inactive: 1}
  enum gender: {male: 0, flame: 1}

  def avatar_medium_url
    avatar.url(:medium)
  end

  def avatar_small_url
    avatar.url(:small)
  end
end
