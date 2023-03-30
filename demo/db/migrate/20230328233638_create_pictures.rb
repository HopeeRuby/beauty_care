# frozen_string_literal: true

# Setup migration
class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :picture, default: ''
      t.timestamps
    end
  end
end
