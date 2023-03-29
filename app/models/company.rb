class Company < ApplicationRecord
  has_many :users
  validate :name_with_out_error, if: :name_not_blank?
  # before_validation :set_dafault_name, if: :name_not_blank?
  before_validation :remove_whitespaces
  validates :location, presence: true

  private

  def name_with_out_error
    errors.add(:name, 'wrong name') if self.name.to_s.match? /[0-9]/
  end
  def name_not_blank?
    !self.name.blank?
  end
  def set_dafault_name
    self.name = 'default name'
  end
  def remove_whitespaces
    name.strip!
  end
end
