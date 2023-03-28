class ChangePhoneTypeProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :phone, :string, default: ''
  end
end
