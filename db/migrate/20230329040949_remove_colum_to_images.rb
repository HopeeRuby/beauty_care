class RemoveColumToImages < ActiveRecord::Migration[7.0]
  def change
    remove_columns :images, :imageable, :imageable_id, :imageable_type 
  end
end
