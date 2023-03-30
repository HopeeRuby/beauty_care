# frozen_string_literal: true

# creat_images
class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :url, default: ''
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
