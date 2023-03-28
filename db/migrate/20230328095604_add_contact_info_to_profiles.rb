class AddContactInfoToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :email, :string, default: ''
    add_column :profiles, :phone, :string, default: ''
    add_column :profiles, :address, :string, default: ''
    add_column :profiles, :age, :integer, default: 0
  end
end
