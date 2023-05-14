class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, default:''
      t.string :description, default:''
      t.decimal :price
      t.integer :quantity
      t.string :images
      t.string :status, default: 0
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
