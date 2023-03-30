# frozen_string_literal: true

# Setup migration
class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end
