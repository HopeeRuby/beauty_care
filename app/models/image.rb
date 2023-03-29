class Image < ApplicationRecord
  belongs_to :post
  belongs_to :img, polymorphic: true
  validates :url, presence: true
  before_save :set_alt_text
  
  private
  
  def set_alt_text
    self.alt_text = File.basename(url, ".*").titleize if alt_text.blank? && url.present?
  end
end
