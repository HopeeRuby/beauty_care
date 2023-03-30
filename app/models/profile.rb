# frozen_string_literal: true

# This class represents user information
class Profile < ApplicationRecord
  belongs_to :user
  has_many :images, as: :img, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :age, numericality: true
  validates :phone, presence: true
  before_validation :check_name, :check_age
  after_save :check_age_saved

  private

  def check_name
    if name.match(/[\d!@#\$%\^&\*\(\)\-\+=\[\]\{\}\\\|;:'",<.>\?\/]/)
      errors.add(:name, "can't contain digits or special characters")
    end
  end

  def check_age
    errors.add(:age, "can't be over 150 years old") if age.present? && age > 150
  end

  def check_age_saved
    Rails.logger.info("Age saved successfully: #{age}") if age.present?
  end
end
