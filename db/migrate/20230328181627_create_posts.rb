class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, default: 'title'
      t.text :description
      t.datetime :deleted_at
      t.datetime :published_at
      t.boolean :active, default: false
      t.text :content
      t.string :image
      t.references :user, null: false, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
