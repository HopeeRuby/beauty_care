# frozen_string_literal: true

# add_img_id_to_images
class AddImgIdToImages < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :img, polymorphic: true
  end
end
