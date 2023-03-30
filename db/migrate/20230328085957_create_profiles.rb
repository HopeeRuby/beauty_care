# frozen_string_literal: true

# creat_profiles
class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, default: ''
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
