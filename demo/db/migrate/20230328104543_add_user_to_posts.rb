# frozen_string_literal: true

# Setup migration
class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
