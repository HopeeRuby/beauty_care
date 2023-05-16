class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name, default: ''
      t.string :description, default: ''
      t.string :image
      t.string :status, default: 0

      t.timestamps
    end
  end
end
