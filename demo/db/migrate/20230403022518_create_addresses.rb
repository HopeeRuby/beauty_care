class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.references :person, foreign_key: true
      t.timestamps
    end
  end
end
