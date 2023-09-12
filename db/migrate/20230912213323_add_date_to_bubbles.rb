class AddDateToBubbles < ActiveRecord::Migration[7.0]
  def change
    add_column :bubbles, :date, :datetime
  end
end
