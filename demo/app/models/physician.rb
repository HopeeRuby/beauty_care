# frozen_string_literal: true

# Setup associations and validations for Physician model
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
