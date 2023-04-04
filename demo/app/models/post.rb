# frozen_string_literal: true

# Setup associations and validations for Post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :content_post, presence: true
  validates :title, length: { maximum: 50 }

  # custom validations

  validate :title_must_be_capitalized

  private

  def title_must_be_capitalized
    errors.add(:title, 'Must be capitalized') unless title.upcase == title
  end

  # def title_not_blank?
  #   title.present?
  # end
end
