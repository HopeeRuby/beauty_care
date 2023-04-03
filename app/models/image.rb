class Image < ApplicationRecord
	belongs_to :post
	validates :img, presence: true
	validates :name_img, presence: true


	after_validation :set_img

	private

  def set_img
    self.img = errors.empty?
  end

  def validate_name_img
  	p name_img
  	arg = name_img.start_with?('space')
  	errors.add(:name_img,"Name invalid") unless arg
  end
end
