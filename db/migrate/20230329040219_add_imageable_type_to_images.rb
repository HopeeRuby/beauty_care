# frozen_string_literal: true

# add_img_imageable_type_to_image
class AddImageableTypeToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :imageable_type, :string
  end
end
