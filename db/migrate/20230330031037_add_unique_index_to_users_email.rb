# frozen_string_literal: true

# add_index_to_user
class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true
  end
end
