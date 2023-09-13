class AddUserIdToBubbles < ActiveRecord::Migration[7.0]
  def change
    add_column :bubbles, :user_id, :integer
    add_index :bubbles, :user_id
  end
end
