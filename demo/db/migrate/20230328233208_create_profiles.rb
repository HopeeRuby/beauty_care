# frozen_string_literal: true

# Setup migration
class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :address, default: ''
      t.string :phone, default: ''
      t.string :sex, default: 'male'
      t.boolean :marriage, default: false
      t.timestamps
    end
  end
end