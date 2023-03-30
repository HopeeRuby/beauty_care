# frozen_string_literal: true

# add_company_id_to_users
class AddCompanyIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, null: false, foreign_key: true, default: 1
  end
end
