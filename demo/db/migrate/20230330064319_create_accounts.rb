class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account
      t.string :password
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
