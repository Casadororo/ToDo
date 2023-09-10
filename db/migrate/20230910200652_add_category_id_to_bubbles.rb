class AddCategoryIdToBubbles < ActiveRecord::Migration[7.0]
  def change
    add_column :bubbles, :category_id, :integer
    add_index :bubbles, :category_id
  end
end
