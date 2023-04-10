class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :quantity, default: 0
      t.decimal :price, precision: 8, scale: 6, default: 0

      t.timestamps
    end
  end
end
