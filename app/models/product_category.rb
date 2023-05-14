class ProductCategory < ApplicationRecord
	has_many :products

	validates :name, presence: true
  validates :description, presence: true

	enum status: { active: 0, deactive: 1 }

	def avatar_medium_url
    image.url(:medium)
  end

  def avatar_small_url
    image.url(:small)
  end

end
