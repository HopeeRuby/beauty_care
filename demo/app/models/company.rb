class Company < ApplicationRecord
  has_many :users

  validates :name, :location, presence: true
  validates :name, :location,  length: { maximum: 30 }
  validates :name, uniqueness: { case_sensitive: false }

  # custom validate
  validate :name_without_errors

  private

  def name_without_errors
    errors.add(:name, 'wrong input name') if self.name.to_s.match? /[0-9]/
  end

end

