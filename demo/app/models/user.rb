class User < ApplicationRecord
  belongs_to :company
  has_many :posts
  has_one :profile

  validates :name, :email, :company_id, presence: true
  validates :name, :email, length: { maximum: 30 }
  validates :name, :email, uniqueness: { case_sensitive: false }
  validates :name, format: { with: /[a-zA-Z]/}

  # custom validate field

  validate :email_with_true_format, if: :fields_not_blank?
  private

  def email_with_true_format
    errors.add(:email, 'wrong format email') unless self.email.include?('@') 
  end
  def fields_not_blank?
    !self.name.blank? && !self.email.blank?
  end

end

  