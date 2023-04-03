# frozen_string_literal: true

# This class represents posts
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :slug, presence: true, uniqueness: true
  before_save :set_slug

  private

  def set_slug
    self.slug = title.parameterize
  end
end
