class ChangeStatusColumnProductCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :product_categories, :status, :integer
  end
end
