class AddReferencesToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :account, null: false
  end
end
