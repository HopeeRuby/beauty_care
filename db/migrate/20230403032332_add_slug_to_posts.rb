# frozen_string_literal: true

# add_slug_to_posts
class AddSlugToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
  end
end