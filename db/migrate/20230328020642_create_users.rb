class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :email, default: ''
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
