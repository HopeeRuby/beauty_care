class Post < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  before_save :set_slug
  
  private

  def set_slug
    self.slug = title.parameterize
  end
end
