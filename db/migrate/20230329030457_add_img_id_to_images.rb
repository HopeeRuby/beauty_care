class AddImgIdToImages < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :img,  polymorphic: true
  end
end
