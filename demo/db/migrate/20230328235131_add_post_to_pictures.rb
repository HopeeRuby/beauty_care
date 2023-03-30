# frozen_string_literal: true

# Setup migration
class AddPostToPictures < ActiveRecord::Migration[7.0]
  def change
    add_reference :pictures, :post, foreign_key: true
  end
end
