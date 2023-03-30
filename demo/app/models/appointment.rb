# frozen_string_literal: true

# Setup associations and validations for Assistant model
class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :physician
end
