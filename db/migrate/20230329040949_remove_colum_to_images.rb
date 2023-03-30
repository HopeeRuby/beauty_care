# frozen_string_literal: true

# remove_colum_to_images
class RemoveColumToImages < ActiveRecord::Migration[7.0]
  def change
    change_table :images do |t|
      t.remove_references :imageable, polymorphic: true
    end
  end
end
