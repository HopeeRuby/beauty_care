# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  has_many :products, dependent: :destroy

  mount_uploader :image, ProductCategoryImageUploader

  validates :name, presence: true
  validates :description, presence: true

  enum status: { active: 0, inactive: 1 }

  def image_medium_url
    image.url(:medium)
  end

  def image_small_url
    image.url(:small)
  end
end
