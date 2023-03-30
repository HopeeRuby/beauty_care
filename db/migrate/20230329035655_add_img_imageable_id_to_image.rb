# frozen_string_literal: true

# add_img_imageable_id_to_image
class AddImgImageableIdToImage < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :imageable_id, :integer
  end
end
