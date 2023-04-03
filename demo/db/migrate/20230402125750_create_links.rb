class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :link
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
