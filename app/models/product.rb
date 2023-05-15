# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  enum status: { active: 0, deactive: 1 }

  def avatar_medium_url
    images.url(:medium)
  end

  def avatar_small_url
    images.url(:small)
  end
end
