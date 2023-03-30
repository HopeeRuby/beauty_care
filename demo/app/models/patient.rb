# frozen_string_literal: true

# Setup associations and validations for Patient model
class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
